import 'package:agricentral/addCrops.dart';
import 'package:agricentral/myCropDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCropPage extends StatefulWidget {
  const MyCropPage({Key? key}) : super(key: key);

  @override
  _MyCropPageState createState() => _MyCropPageState();
}

class _MyCropPageState extends State<MyCropPage> {
  var db = FirebaseFirestore.instance;
  late SharedPreferences sharedPreferences;
  late var username;

  @override
  void initState() {
    super.initState();
    initial().whenComplete(() {
      setState(() {});
    });
  }

  initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    username = sharedPreferences.getString('email')!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.teal[200]),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("My Crops"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => AddCropPage());
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Expanded(
                  child: StreamBuilder(
                    stream: db
                        .collection("Users")
                        .doc(username)
                        .collection("Crops")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        );
                      }
                      // Need to put while condition to check if document has a message

                      return SingleChildScrollView(
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              dynamic document =
                                  snapshot.data!.docs[index].data();

                              // if (document['Message'] != Null) {
                              //   document['Message'].delete();
                              // }

                              return Center(
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  padding: EdgeInsets.all(8),
                                  decoration:
                                      BoxDecoration(color: Colors.teal[200]),
                                  child: Card(
                                    color: Colors.teal[900],
                                    elevation: 8,
                                    shadowColor: Colors.teal[200],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ListTile(
                                      trailing: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                      ),
                                      title: Text(
                                        "Crop Name: " +
                                            document['Crop Name'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      subtitle: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Land area: " +
                                                  document['Land Area']
                                                      .toString(),
                                              style: (TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                            ),
                                            Text(
                                              "Expected Harvest time: " +
                                                  document[
                                                          'Expected Harvest Duration']
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Get.to(MyCropDetailPage(document));
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
