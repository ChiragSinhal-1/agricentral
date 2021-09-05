import 'drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class notificationPage extends StatefulWidget {
  @override
  _notificationPageState createState() => _notificationPageState();
}

// ignore: camel_case_types
class _notificationPageState extends State<notificationPage> {
  late SharedPreferences sharedPreferences;
  final db = FirebaseFirestore.instance;
  late String useremail;
  // ignore: non_constant_identifier_names
  late bool is_read = false;

  @override
  void initState() {
    // MessagingWidget();
    initial().whenComplete(() {
      setState(() {});
    });
    super.initState();
  }

  initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      useremail = sharedPreferences.getString('email')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.tealAccent, Colors.teal]),
      ),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Notifications"),
          centerTitle: true,
        ),
        drawer: DrawerWidget(),
        body: StreamBuilder(
          stream: db
              .collection("Notifications")
              .doc(useremail)
              .collection("notify")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              );
            }

            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  dynamic document = snapshot.data!.docs[index].data();

                  return Center(
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.tealAccent, Colors.teal])),
                      child: Card(
                        color: Colors.white,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                is_read
                                    ? Icons.notifications
                                    : Icons.notifications_active,
                                color: is_read ? Colors.teal : Colors.red,
                              ),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                document!['time'].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Text(
                                document['date'].toString(),
                                style: TextStyle(
                                    fontSize: 13, color: Colors.blueGrey),
                              )
                            ],
                          ),
                          title: Text(
                            document['title'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontSize: 18),
                          ),
                          subtitle: Text(document['message'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                  fontSize: 15)),
                          onTap: () {
                            snapshot.data!.docs[index].reference
                                .update({'is_read': true});
                          },
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
