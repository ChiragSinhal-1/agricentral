import 'package:agricentral/myCrops.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCropPage extends StatefulWidget {
  const AddCropPage({Key? key}) : super(key: key);

  @override
  _AddCropPageState createState() => _AddCropPageState();
}

class _AddCropPageState extends State<AddCropPage> {
  final db = FirebaseFirestore.instance;
  late SharedPreferences sharedPreferences;
  late String username;
  late DateTime plantedOn;

  TextEditingController cropNameController = TextEditingController();
  TextEditingController cropPriceController = TextEditingController();
  TextEditingController seedQuantityController = TextEditingController();
  TextEditingController seedPriceController = TextEditingController();
  TextEditingController fertilizerPriceController = TextEditingController();
  TextEditingController staffSalaryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController landAreaController = TextEditingController();
  TextEditingController expectedHarvestTimeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // List<ListItem> _dropdownItemsUserType = [
  //   ListItem('farmer', "farmer"),
  //   ListItem('transport', "transport"),
  // ];

  @override
  void initState() {
    initial();
    super.initState();
    plantedOn = DateTime.now();
  }

  void initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    username = sharedPreferences.getString('email')!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Add Crop"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            // alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 24, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Hello!",
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
                  "Please enter your crop details.",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Color(0xff152238),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    alignment: Alignment.center,
                    image: AssetImage('undraw_farm_girl_dnpe.png'),
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
                            labelText: 'Crop Name',
                            counterText: '',
                          ),
                          validator: (input) {
                            if (input!.isEmpty) {
                              return "Please Enter your Crop Name";
                            }
                          },
                          controller: cropNameController,
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
                            labelText: 'Seed Quantity (in KG)',
                            counterText: '',
                          ),
                          controller: seedQuantityController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.mobile_friendly,
                                size: IconTheme.of(context).size,
                                color: Colors.teal),
                            labelText: 'Seed Price (in Rs)',
                            counterText: '',
                          ),
                          controller: seedPriceController,
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
                            labelText: 'Fertilizer Price (in Rs)',
                            counterText: '',
                          ),
                          controller: fertilizerPriceController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.security,
                                size: IconTheme.of(context).size,
                                color: Colors.teal),
                            labelText: 'Maintainance Charges (in Rs)',
                            counterText: '',
                          ),
                          controller: staffSalaryController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.security,
                                size: IconTheme.of(context).size,
                                color: Colors.teal),
                            labelText: 'Land area (in acre)',
                            counterText: '',
                          ),
                          controller: landAreaController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.security,
                                size: IconTheme.of(context).size,
                                color: Colors.teal),
                            labelText: 'Location',
                            counterText: '',
                          ),
                          controller: locationController,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.security,
                                size: IconTheme.of(context).size,
                                color: Colors.teal),
                            labelText: 'Expected Harvest Duration (in days)',
                            counterText: '',
                          ),
                          controller: expectedHarvestTimeController,
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
                              await db
                                  .collection("Users")
                                  .doc(username)
                                  .collection("Crops")
                                  .doc(cropNameController.text)
                                  .set({
                                "Crop Name": cropNameController.text,
                                "Expected Harvest Duration":
                                    expectedHarvestTimeController.text +
                                        " days",
                                "Planed On": plantedOn.toString(),
                                "Fertilizer's Cost": "Rs. " +
                                    fertilizerPriceController.text +
                                    "/-",
                                "Seed Price":
                                    "Rs. " + seedPriceController.text + "/-",
                                "Maintainance cost":
                                    "Rs. " + staffSalaryController.text + "/-",
                                "Seed Quantity":
                                    seedQuantityController.text + " KG",
                                "Land Area": landAreaController.text + "acre",
                                "Location": locationController.text
                              });
                              Get.offAll(() => MyCropPage());
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
