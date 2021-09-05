import 'package:agricentral/cropHealth.dart';
import 'package:agricentral/map.dart';
import 'package:agricentral/myCrops.dart';
import 'package:agricentral/myDashboard.dart';
import 'package:agricentral/notification.dart';
import 'package:agricentral/supplyChain.dart';
import 'package:agricentral/userProfile_page/user_profile.dart';
import 'package:agricentral/workInProgress.dart';
import 'package:firebase_core/firebase_core.dart';
import 'register.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: ""),
        '/dashboard': (context) => MyDashboardPage(),
        '/userProfile': (context) => ProfilePage(),
        '/cropHealth': (context) => CropHealthPage(),
        '/map': (context) => ResourceLocatorMap(),
        '/myCrops': (context) => MyCropPage(),
        '/notification': (context) => notificationPage(),
        '/workInProgress': (context) => WorkInProgress(),
        '/transportRequest': (context) => RaiseTransportRequest()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: [
                    new Image(
                      // alignment: Alignment.topLeft,
                      image: AssetImage('logo.png'),
                      fit: BoxFit.scaleDown,
                      height: MediaQuery.of(context).size.height / 3.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 20),
                      child: Text(
                        "This is an application to improve the quality of agri farms",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Color(0xff152238),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Image(
                  image: AssetImage('undraw_welcome_cats_thqn.png'),
                  fit: BoxFit.scaleDown,
                  height: MediaQuery.of(context).size.height / 3.5,
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.green,
                        decoration: BoxDecoration(
                            color: Colors.teal[400],
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () {
                            print("object");
                            Get.to(() => LoginPage());
                          },
                          child: Text(
                            "L O G I N",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.workSans(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.green,
                        decoration: BoxDecoration(
                            color: Color(0xff4FC3F7),
                            borderRadius: BorderRadius.circular(20)),
                        child: InkWell(
                          onTap: () {
                            print("signup");
                            Get.to(RegisterPage());
                          },
                          child: Text(
                            "S I G N  U P",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.workSans(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
