import 'package:agricentral/cropHealth.dart';
import 'package:agricentral/login.dart';
import 'package:agricentral/myDashboard.dart';
import 'package:agricentral/userProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late SharedPreferences sharedPreferences;
  var username;
  String useremail = '';
  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    username = sharedPreferences.getString('email');
    setState(() {
      useremail = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // padding: EdgeInsets.only(left: 25),
        decoration: BoxDecoration(color: Colors.white),
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              currentAccountPicture: new GestureDetector(
                onTap: () {},
                child: new CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              accountName: new Text(
                "",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: new Text(
                "",
                style: TextStyle(color: Colors.black),
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(
                    "undraw_before_dawn_bqrj.png",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              onDetailsPressed: () {},
            ),
            new ListTile(
              title: new Text(
                "Dashboard",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              leading: new Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Get.to(() => MyDashboardPage());
              },
            ),
            new ListTile(
              title: new Text(
                "Reservation",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              leading: new Icon(Icons.add_chart, color: Colors.black),
              onTap: () {
                Navigator.of(context).pop();
                Get.to(() => UserProfilePage());
              },
            ),
            new ListTile(
              title: new Text(
                "Crop Health",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              leading: new Icon(Icons.add_chart, color: Colors.black),
              onTap: () {
                Navigator.of(context).pop();
                Get.to(() => CropHealthPage());
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text(
                "Logout",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              leading: new Icon(Icons.logout, color: Colors.black),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAll(LoginPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
