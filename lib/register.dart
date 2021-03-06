import 'package:agricentral/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class ListItem {
  var value;
  String name;
  ListItem(this.value, this.name);
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController rePwdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _userType = 'farmer';
  List<ListItem> _dropdownItemsUserType = [
    ListItem('farmer', "farmer"),
    ListItem('transport', "transport"),
  ];

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
                  child: Form(
                    key: _formKey,
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
                          validator: (input) {
                            if (input!.isEmpty) {
                              return "Please Enter your name";
                            }
                          },
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
                            icon: Icon(Icons.mobile_friendly,
                                size: IconTheme.of(context).size,
                                color: Colors.teal),
                            labelText: 'Phone Number',
                            counterText: '',
                          ),
                          validator: (input) {
                            if (!(input!.length == 10)) {
                              return "Please Enter Valid Phone Number";
                            }
                          },
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
                          validator: (input) {
                            if (input!.length < 6) {
                              return "Password should contain atlest 6 characters.";
                            }
                          },
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
                          validator: (input) {
                            if (input != pwdController.text) {
                              return "Password should match the previous field";
                            }
                          },
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text("Select User type"),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: DropdownButton(
                            hint: Text("Select User type"),
                            elevation: 8,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            icon: Icon(Icons.arrow_drop_down_circle),
                            iconDisabledColor: Colors.grey,
                            iconEnabledColor: Colors.teal,
                            isExpanded: true,
                            dropdownColor: Colors.teal,
                            value: _userType,
                            items: _dropdownItemsUserType.map((ListItem item) {
                              return DropdownMenuItem<String>(
                                child: Text(
                                  item.name,
                                ),
                                value: item.value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _userType = value.toString();
                              });
                            },
                          ),
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
                              print("signup Clicked");
                              await FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(emailController.text)
                                  .set({
                                "Name": nameController.text,
                                "Mobile Number": phoneController.text,
                                "Email": emailController.text,
                                "User Type": _userType
                              });
                              await signUp();
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: pwdController.text);

        Navigator.of(context).pop();
        Get.off(() => MyHomePage(title: "AgriCentral"));
      } catch (e) {
        AlertDialog alert = AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User Registration Failed!!!",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                e.toString(),
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.to(() => RegisterPage());
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
