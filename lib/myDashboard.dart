import 'package:agricentral/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyDashboardPage extends StatefulWidget {
  const MyDashboardPage({Key? key}) : super(key: key);

  @override
  _MyDashboardPageState createState() => _MyDashboardPageState();
}

class _MyDashboardPageState extends State<MyDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Container(
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff0D5265), Color(0xff7FF9E2)]),
        ),
        child: Scaffold(
          backgroundColor: Color(0xff7FF9E2),
          appBar: AppBar(
            title: Text("Dashboard"),
            centerTitle: true,
          ),
          drawer: DrawerWidget(),
          body: Container(
            padding: EdgeInsets.only(top: 15),
            child: StaggeredGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              children: <Widget>[
                MyItems(Icons.all_inbox_rounded, "User Profile", 0xffFF8300,
                    "/userProfile"),
                MyItems(Icons.album_rounded, "Crop Health", 0xffCB4C4E,
                    '/cropHealth'),

                MyItems(Icons.person, "My Crops", 0xff0D5265, "/myResource"),
                MyItems(Icons.notifications_active_rounded, "Notifications",
                    0xff01a982, '/notification'),

                MyItems(Icons.location_on_rounded, "Map", 0xffFF8300, '/map'),
                MyItems(Icons.qr_code_scanner_rounded, "Agri Scanner",
                    0xff0D5265, '/scannerPage'),
                MyItems(Icons.design_services_rounded, "Raise transport ticket",
                    0xffFEC901, '/serviceTicket'),

                // MyItems(Icons.power_settings_new_rounded,"Active Servers",0xff01a982),
              ],
              staggeredTiles: [
                StaggeredTile.extent(2, 130.0),
                StaggeredTile.extent(1, 260.0),
                StaggeredTile.extent(1, 125.0),
                StaggeredTile.extent(1, 125.0),
                StaggeredTile.extent(1, 125.0),
                StaggeredTile.extent(1, 125.0),
                StaggeredTile.extent(2, 130.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Material MyItems(IconData icon, String heading, int color, String page) {
    return Material(
      color: Colors.white,
      elevation: 14,
      shadowColor: Color(0xff32DAC8),
      borderRadius: BorderRadius.circular(24),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, page);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        heading,
                        style: TextStyle(
                          color: new Color(color),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Material(
                      color: new Color(color),
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 20,
                        ),
                        padding: EdgeInsets.all(16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Do you want to exit the app?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context, true);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }
}
