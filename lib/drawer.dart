import 'package:agricentral/cropHealth.dart';
import 'package:agricentral/main.dart';
import 'package:agricentral/map.dart';
import 'package:agricentral/myCrops.dart';
import 'package:agricentral/myDashboard.dart';
import 'package:agricentral/supplyChain.dart';
import 'package:agricentral/userProfile_page/user_profile.dart';
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
                onTap: () {
                  Get.to(() => ProfilePage());
                },
                child: new CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage:
                      AssetImage('zoe-schaeffer-eoAubhPm6H8-unsplash.jpeg'),
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
                    "undraw_Country_side_k696.png",
                  ),
                  fit: BoxFit.scaleDown,
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
                color: Colors.teal[900],
              ),
              onTap: () {
                Navigator.of(context).pop();
                Get.to(() => MyDashboardPage());
              },
            ),
            new ListTile(
              title: new Text(
                "My Crops",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              leading: new Icon(
                Icons.agriculture,
                color: Colors.teal[900],
              ),
              onTap: () {
                Navigator.of(context).pop();
                Get.to(() => MyCropPage());
              },
            ),
            new ListTile(
              title: new Text(
                "Crop Catalog",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              leading: new Icon(Icons.book, color: Colors.teal[900]),
              onTap: () {
                Navigator.of(context).pop();
                Get.to(() => CropHealthPage());
              },
            ),
            new ListTile(
              title: new Text(
                "Market",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              leading: new Icon(Icons.add_chart, color: Colors.teal[900]),
              onTap: () {
                Navigator.of(context).pop();
                Get.to(() => ResourceLocatorMap());
              },
            ),
            new ListTile(
              title: new Text(
                "Transport",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              leading: new Icon(Icons.transfer_within_a_station,
                  color: Colors.teal[900]),
              onTap: () {
                Navigator.of(context).pop();
                Get.to(() => RaiseTransportRequest());
              },
            ),
            new ListTile(
              title: new Text(
                "Notifications",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              leading: new Icon(Icons.notifications_active_rounded,
                  color: Colors.teal[900]),
              onTap: () {
                Navigator.of(context).pop();
                Get.to(() => ProfilePage());
              },
            ),
            new ListTile(
              title: new Text(
                "Agri Scanner",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              leading: new Icon(Icons.scanner_rounded, color: Colors.teal[900]),
              onTap: () {
                Navigator.of(context).pop();
                Get.to(() => ProfilePage());
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
              leading: new Icon(Icons.logout, color: Colors.red),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAll(MyHomePage(
                  title: "",
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
