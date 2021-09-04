import 'package:agricentral/muOrders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RaiseTransportRequest extends StatefulWidget {
  const RaiseTransportRequest({Key? key}) : super(key: key);

  @override
  _RaiseTransportRequestState createState() => _RaiseTransportRequestState();
}

class ListItem {
  var value;
  String name;
  ListItem(this.value, this.name);
}

class _RaiseTransportRequestState extends State<RaiseTransportRequest> {
  TextEditingController picupLocationController = TextEditingController();
  TextEditingController dropLocationController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String _crops = 'Wheat';
  String _transporter = 'Transporter 1';

  List<ListItem> _dropdownItemsCrops = [
    ListItem('Wheat', "Wheat"),
    ListItem('Rice', "Rice"),
    ListItem('Corn', "Corn"),
  ];
  List<ListItem> _dropdownItemsTransporter = [
    ListItem('Transporter 1', "Transporter 1"),
    ListItem('Transporter 2', "Transporter 2"),
    ListItem('Transporter 3', "Transporter 3"),
  ];

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Raise Transport Request"),
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
                  "Please fill the details to raise a transport request",
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
                    image: AssetImage('undraw_Environmental_study_re_q4q8.png'),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Select Crop"),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: DropdownButton(
                            hint: Text("Select Crop"),
                            elevation: 8,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            icon: Icon(Icons.arrow_drop_down_circle),
                            iconDisabledColor: Colors.grey,
                            iconEnabledColor: Colors.teal,
                            isExpanded: true,
                            dropdownColor: Colors.teal,
                            value: _crops,
                            items: _dropdownItemsCrops.map((ListItem item) {
                              return DropdownMenuItem<String>(
                                child: Text(
                                  item.name,
                                ),
                                value: item.value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _crops = value.toString();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Select Transporter"),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: DropdownButton(
                            hint: Text("Select Transporter"),
                            elevation: 8,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            icon: Icon(Icons.arrow_drop_down_circle),
                            iconDisabledColor: Colors.grey,
                            iconEnabledColor: Colors.teal,
                            isExpanded: true,
                            dropdownColor: Colors.teal,
                            value: _transporter,
                            items:
                                _dropdownItemsTransporter.map((ListItem item) {
                              return DropdownMenuItem<String>(
                                child: Text(
                                  item.name,
                                ),
                                value: item.value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _transporter = value.toString();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.person,
                                size: IconTheme.of(context).size,
                                color: Colors.teal),
                            labelText: 'Picup Location',
                            counterText: '',
                          ),
                          controller: picupLocationController,
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
                            labelText: 'Dropoff Location',
                            counterText: '',
                          ),
                          controller: dropLocationController,
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
                            labelText: 'Total Weight (in kg)',
                            counterText: '',
                          ),
                          controller: weightController,
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
                            labelText: 'Phone Number',
                            counterText: '',
                          ),
                          controller: phoneController,
                          keyboardType: TextInputType.number,
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
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection("Transport Request")
                                  .doc(username)
                                  .collection("Crops")
                                  .add({
                                // "Name": nameController.text,
                                "Mobile Number": phoneController.text,
                                "Email": username,
                                "Crop": _crops,
                                "Transporter": _transporter,
                                "Order Date": "",
                                "Order Approved": "False",
                                "Order Picked": "False",
                                "Order Delivered": "False",
                                "Total Weight": weightController.text,
                                "Pickup Location": picupLocationController.text,
                                "Destination": dropLocationController.text,
                                "Expected Delivery": "9 Days",
                                "Total Cost": 1000,
                                "order status": "pending"
                              });
                              Get.offAll(() => MyOrdersPage());
                            },
                            child: Text(
                              "Submit",
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
}
