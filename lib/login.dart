import 'package:agricentral/myDashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Container(
              // alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height / 1.1,
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Welcome Back!",
                        // textAlign: TextAlign.start,
                        style: GoogleFonts.comfortaa(
                          fontSize: 25,
                          color: Color(0xff29AB87),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Please login using your credentials",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Color(0xff152238),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image(
                      alignment: Alignment.center,
                      image: AssetImage('undraw_Access_account_re_8spm.png'),
                      fit: BoxFit.scaleDown,
                      height: MediaQuery.of(context).size.height / 3.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.email,
                                  size: IconTheme.of(context).size,
                                  color: Colors.teal),
                              labelText: 'E-Mail',
                              counterText: '',
                            ),
                            validator: (input) {
                              if (!(input!.contains('@'))) {
                                return "Please Enter a valid email";
                              }
                            },
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock,
                                  size: IconTheme.of(context).size,
                                  color: Colors.teal),
                              labelText: 'Password',
                              counterText: '',
                            ),
                            validator: (input) {
                              if (input!.length < 6) {
                                return "your password needs to be atlease 6 characters.";
                              }
                            },
                            controller: pwdController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          new Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2,
                            // color: Colors.green,
                            decoration: BoxDecoration(
                                color: Colors.teal[400],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                              onPressed: () async {
                                final SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    'email', emailController.text);
                                signIn();
                              },
                              child: Text(
                                "L O G I N",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.workSans(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: pwdController.text.trim());

        Get.off(() => MyDashboardPage());
      } catch (e) {
        AlertDialog alert = AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Wrong Credentials!!!",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Please check your email and password again.",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    Get.to(() => LoginPage());
                  });

                  Navigator.of(context).pop();
                },
                child: Text("Ok")),
          ],
        );
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            });
      }
    }
  }
}
