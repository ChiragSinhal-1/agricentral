import 'package:agricentral/orderStatus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
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
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Orders"),
          centerTitle: true,
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
                        .collection("Transport Request")
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
                                            document['Crop'].toString(),
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
                                              "Transporter: " +
                                                  document['Transporter']
                                                      .toString(),
                                              style: (TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                            ),
                                            document["Order Approved"] ==
                                                    "False"
                                                ? Text(
                                                    "Status: Approval Pending",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  )
                                                : Text(
                                                    "Status: Request Approved",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Get.to(() => OrderStatus(document));
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
