import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController rePwdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Register"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            // alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 48, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Hello",
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
                  "Please register using your details.",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Color(0xff152238),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    alignment: Alignment.center,
                    image: AssetImage('undraw_Mobile_login_re_9ntv.png'),
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
                          icon: Icon(Icons.person,
                              size: IconTheme.of(context).size,
                              color: Colors.teal),
                          labelText: 'Full Name',
                          counterText: '',
                        ),
                        controller: nameController,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 16,
                      ),
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
                          icon: Icon(Icons.mobile_friendly,
                              size: IconTheme.of(context).size,
                              color: Colors.teal),
                          labelText: 'Phone Number',
                          counterText: '',
                        ),
                        controller: phoneController,
                        keyboardType: TextInputType.number,
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
                        height: 16,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.security,
                              size: IconTheme.of(context).size,
                              color: Colors.teal),
                          labelText: 'Enter Password Again',
                          counterText: '',
                        ),
                        controller: rePwdController,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                        height: 40,
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
                            print("signup Clicked");
                            Get.to(() => RegisterPage());
                          },
                          child: Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.workSans(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
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
