import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.white),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Login"),
            centerTitle: true,
          ),
          body: Container(
            // alignment: Alignment.topCenter,
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(
                  height: 30,
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
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
