// // import 'dart:ffi';
// import 'dart:io' as io;
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path_provider/path_provider.dart';
// import 'scannerPage.dart';
// import 'myDashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:csv/csv.dart';

// var testBoeNo = "null";
// late String fileLocation;
// List newProductNumbers = [];

// // ignore: camel_case_types
// class extractedTextScreen extends StatefulWidget {
//   final text;
//   final image;
//   extractedTextScreen(this.text, this.image);

//   @override
//   _extractedTextScreenState createState() => _extractedTextScreenState();
// }

// class _extractedTextScreenState extends State<extractedTextScreen> {
//   String bodyText = '';
//   GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   List<DynamicTextFieldWidget> listDynamic = [];

//   addDynamic() {
//     listDynamic.add(new DynamicTextFieldWidget());
//     setState(() {});
//   }

//   Future saveProductData() async {
//     listDynamic.forEach((widget) async {
//       print(widget.newProductController.text);
//       List<dynamic> associateList = [
//         {
//           "shipDate": " ",
//           "mawb": " ",
//           "trackingNo": " ",
//           "shipRef": " ",
//           "cth": " ",
//           "exchangeRate": " ",
//           "boeNo": " ",
//           "cifValue": " ",
//           "invoiceNo": " ",
//           "invoiceValue": " ",
//           "companyName": " ",
//           "prNumber": widget.newProductController.text,
//           "description": " ",
//           "igstValue": " "
//         },
//       ];

//       List<List<dynamic>> rows = [];

//       List<dynamic> row = [];

//       rows.add(row);

//       for (int i = 0; i < associateList.length; i++) {
//         List<dynamic> row = [];
//         row.add(associateList[0]["shipDate"]);
//         row.add(associateList[0]["mawb"]);
//         row.add(associateList[0]["trackingNo"]);
//         row.add(associateList[0]["shipRef"]);
//         row.add(associateList[0]["cth"]);
//         row.add(associateList[0]["exchangeRate"]);
//         row.add(associateList[0]["boeNo"]);
//         row.add(associateList[0]["cifValue"]);
//         row.add(associateList[0]["invoiceNo"]);
//         row.add(associateList[0]["InvoiceValue"]);
//         row.add(associateList[0]["companyName"]);
//         row.add(associateList[0]["prNumber"]);
//         row.add(associateList[0]["description"]);
//         row.add(associateList[0]["igstValue"]);

//         rows.add(row);
//       }

//       String csv = const ListToCsvConverter().convert(rows);

//       io.Directory? docDirectory = await getExternalStorageDirectory();
//       String docPath = docDirectory!.path;
//       print('$docPath');
//       io.File shipmentScannerCsv =
//           io.File('$docPath/' + fileNameController.text + '.csv');
//       fileLocation = "$docPath/" + fileNameController.text + ".csv";

//       shipmentScannerCsv.writeAsString(csv, mode: io.FileMode.append);
//     });
//   }

//   TextEditingController fileNameController = TextEditingController();
//   TextEditingController mawbController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   TextEditingController trackingController = TextEditingController();
//   TextEditingController shipmentController = TextEditingController();
//   TextEditingController exchangeRateController = TextEditingController();
//   TextEditingController cthController = TextEditingController();
//   TextEditingController boeNoController = TextEditingController();
//   TextEditingController cifController = TextEditingController();
//   TextEditingController invoiceNoAndDateController = TextEditingController();
//   TextEditingController invoiceValueController = TextEditingController();
//   TextEditingController companyNameController = TextEditingController();
//   TextEditingController productNumberController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController igstValueController = TextEditingController();

//   // RegExp mawb = RegExp(r"\b[\d]{16}\b");
//   // RegExp executedDate = RegExp(r"[\d]{2}[/][\d]{2}[/][\d]{4}");
//   // RegExp sin = RegExp(r"SIN-[\d]{4}[\s][\d]{4}\b");
//   // RegExp mawb = RegExp(r"[\d]{3}[-][\d]{4}[\s][\d]{4}");
//   RegExp executedDate = RegExp(r"[\d]{2}[-\./][\d]{2}[-\./][\d]{4}");
//   RegExp mawb = RegExp(r"[\d]{11}\b");
//   RegExp sin = RegExp(r"[\D]{3}[\d]{8}\b");
//   RegExp cneeRef = RegExp(r"[A-Z][0-9A-Z][A-Z][A-Z][\d]{8}\b");
//   RegExp exchangeRate = RegExp(r"\b[\d]{2}\.[\d]{4}\b[\s][\w]{1,3}");
//   RegExp cth = RegExp(r"\b[\d]{8}\b");
//   RegExp boeNo = RegExp(r":[\d]{7}[/]");
//   RegExp cifValue = RegExp(r"[\d]{5,9}\.[\d]{2}\b");
//   RegExp invoiceNoAndDate =
//       RegExp(r"\b[\s]{0,1}[\w]{10}\b[\s][\d]{2}[/][\d]{2}[/][\d]{4}\b");
//   RegExp invoiceValue = RegExp(r"\b[\s][\d]{4}\.[\d]{2}[\s][\w]{0,3}");
//   RegExp companyName = RegExp(
//       r"M[/]S[\.]{0,1}[\s][\w]{2,9}[\s][\w]{0,9}[\s][\w]{0,9}[\s][\w]{0,9}[\s][\w]{0,9}\b");
//   RegExp description = RegExp(
//       r"[\s]\b[\w]{1,5}\b[\w]{1,7}[\s]{1,2}[\w]{2,6}[\s][\w]{1,5}[\s][\w]{0,9}");
//   RegExp productNumber = RegExp(r"[\s]\b[\w]{4,8}[-][\w]{2,5}\b[\s]");

//   var mawbCode = "null";
//   var trackingNo = "null";
//   var shipref = "null";
//   var exe_date = "null";
//   var exchange_rate = "null";
//   var CTH = "null";
//   var Boe_No = testBoeNo;
//   var cif_value = "null";
//   var invoiceNo = "null";
//   var invValue = "null";
//   var compName = "null";
//   var desc = "null";
//   var prNumber = "null";

//   late List<PickedFile> imageList;

//   iteratableFunction(String bodyText) {
//     Iterable<RegExpMatch> dates = executedDate.allMatches(bodyText);
//     print("Date is: ");
//     for (var date in dates) {
//       print(date[0]);
//       exe_date = date[0].toString();
//       dateController.text = exe_date;
//     }
//     Iterable<RegExpMatch> mawb_code = mawb.allMatches(bodyText);
//     print("MAWB is: ");
//     for (var code in mawb_code) {
//       print(code[0]);
//       mawbCode = code[0].toString();
//       mawbController.text = mawbCode;
//     }
//     Iterable<RegExpMatch> sinNos = sin.allMatches(bodyText);
//     print("SIN Number is: ");
//     for (var sinNo in sinNos) {
//       print(sinNo[0]);
//       trackingNo = sinNo[0].toString();
//       trackingController.text = trackingNo;
//     }
//     Iterable<RegExpMatch> cneeRefs = cneeRef.allMatches(bodyText);
//     print("CNEE REF is: ");
//     for (var cnee in cneeRefs) {
//       print(cnee[0]);
//       shipref = cnee[0].toString();
//       shipmentController.text = shipref;
//     }
//     Iterable<RegExpMatch> exchangeRates = exchangeRate.allMatches(bodyText);
//     print("Exchange Rate is: ");
//     for (var exc_rate in exchangeRates) {
//       print(exc_rate[0]);
//       exchange_rate = exc_rate[0].toString();
//       exchangeRateController.text = exchange_rate;
//     }
//     Iterable<RegExpMatch> cth_values = cth.allMatches(bodyText);
//     print("CTH is: ");
//     for (var cth_value in cth_values) {
//       print(cth_value[0]);
//       CTH = cth_value[0].toString();
//       cthController.text = CTH;
//     }
//     Iterable<RegExpMatch> BOE_Numbers = boeNo.allMatches(bodyText);
//     print("BOE No.: ");
//     for (var BOE_Number in BOE_Numbers) {
//       print(BOE_Number[0]);
//       Boe_No = BOE_Number[0].toString();
//       Boe_No.replaceAll(':', "");
//       Boe_No.replaceAll("/", "");
//       boeNoController.text = Boe_No;
//     }
//     Iterable<RegExpMatch> cif_numbers = cifValue.allMatches(bodyText);
//     print("CIF Value: ");
//     for (var cif_number in cif_numbers) {
//       print(cif_number[0]);
//       cif_value = cif_number[0].toString();
//       cifController.text = cif_value;
//     }
//     Iterable<RegExpMatch> invoiceNos = invoiceNoAndDate.allMatches(bodyText);
//     print("Invoice No and Date: ");
//     for (var singleInvoiceNo in invoiceNos) {
//       print(singleInvoiceNo[0]);
//       invoiceNo = singleInvoiceNo[0].toString();
//       invoiceNoAndDateController.text = invoiceNo;
//     }
//     Iterable<RegExpMatch> invoiceValues = invoiceValue.allMatches(bodyText);
//     print("Invoice Value: ");
//     for (var singleInvoiceValue in invoiceValues) {
//       print(singleInvoiceValue[0]);
//       invValue = singleInvoiceValue[0].toString();
//       invoiceValueController.text = invValue;
//     }
//     Iterable<RegExpMatch> companyNames = companyName.allMatches(bodyText);
//     print("Company Name: ");
//     for (var comName in companyNames) {
//       print(comName[0]);
//       compName = comName[0].toString();
//       companyNameController.text = compName;
//     }
//     Iterable<RegExpMatch> descs = description.allMatches(bodyText);
//     print("Description: ");
//     for (var descrip in descs) {
//       print(descrip[0]);
//       desc = descrip[0].toString();
//       descriptionController.text = desc;
//     }
//     Iterable<RegExpMatch> prNums = productNumber.allMatches(bodyText);
//     print("Product Number: ");
//     for (var prNum in prNums) {
//       print(prNum[0]);
//       prNumber = prNum[0].toString();
//       productNumberController.text = prNumber;
//     }
//     setState(() {});
//   }

//   buildData() async {
//     final setNewData = await Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => scannerPage(
//               isFirst: false,
//               title: '',
//             )));
//     if (setNewData != null) {
//       setState(() {
//         bodyText = setNewData[1].toString();
//         imageList.add(setNewData[0]);
//         iteratableFunction(bodyText);
//       });
//     }
//   }

//   @override
//   void initState() {
//     bodyText = widget.text;
//     imageList = [widget.image];
//     iteratableFunction(bodyText);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           gradient:
//               LinearGradient(colors: [Colors.tealAccent, Colors.green])),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           title: Text("Extracted Text"),
//           centerTitle: true,
//           actions: [
//             IconButton(
//                 icon: Icon(Icons.add),
//                 onPressed: () {
//                   buildData();
//                 })
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         colors: [Colors.tealAccent, Colors.green])),
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ListView(
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       children: <Widget>[
//                         _buildTextField(mawbController, "MAWB"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _buildTextField(dateController, "Date"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _buildTextField(
//                             trackingController, "Transaction Number"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _buildTextField(shipmentController, "Shipment Number:"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _buildTextField(
//                             exchangeRateController, "Exchange Rate"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _buildTextField(cthController, "CTH"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _buildTextField(boeNoController, "BOE No."),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _buildTextField(cifController, "CIF Value"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _buildTextField(
//                             invoiceNoAndDateController, "Invoice No. and Date"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _buildTextField(
//                             invoiceValueController, "Invoice Value"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _buildTextField(companyNameController, "Company Name"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _buildTextField(
//                             productNumberController, "Product Number"),
//                         SizedBox(
//                           height: 3,
//                         ),
//                         TextButton(
//                             onPressed: () {
//                               addDynamic();
//                             },
//                             child: Text(
//                               "Add new product number",
//                               style: TextStyle(color: Colors.white),
//                             )),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         new Container(
//                           height: 150,
//                           width: MediaQuery.of(context).size.width,
//                           child: new Column(
//                             children: <Widget>[
//                               new Flexible(
//                                   child: new ListView.builder(
//                                       itemCount: listDynamic.length,
//                                       itemBuilder: (_, index) =>
//                                           listDynamic[index])),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _buildTextField(descriptionController, "Description"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _buildTextField(igstValueController, "IGST Ass. Value"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Divider(
//                           height: 10,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               border: Border.all(color: Colors.teal)),
//                           child: Form(
//                             key: globalFormKey,
//                             child: TextFormField(
//                               validator: (input) => input!.isEmpty
//                                   ? "Please give this file a name!!!"
//                                   : null,
//                               controller: fileNameController,
//                               style: TextStyle(color: Colors.white),
//                               decoration: InputDecoration(
//                                   contentPadding:
//                                       EdgeInsets.symmetric(horizontal: 10),
//                                   labelText: "Enter File Name",
//                                   labelStyle: TextStyle(color: Colors.white),
//                                   border: InputBorder.none),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         // ignore: deprecated_member_use
//                         RaisedButton(
//                           onPressed: () async {
//                             if (validateAndSave()) {
//                               await _generateCsvFile();
//                               await saveProductData();

//                               AlertDialog alert = AlertDialog(
//                                 title: Text(
//                                   "Success",
//                                   style: TextStyle(
//                                       color: Colors.tealAccent,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 25),
//                                 ),
//                                 content: Text(
//                                   "File " +
//                                       fileNameController.text +
//                                       " created Successfully at location " +
//                                       fileLocation,
//                                   style: TextStyle(
//                                       color: Colors.teal, fontSize: 18),
//                                 ),
//                                 actions: [
//                                   TextButton(
//                                       onPressed: () {
//                                         Navigator.pop(context, false);
//                                         Get.off(() => MyDashboardPage());
//                                       },
//                                       child: Text("Ok")),
//                                 ],
//                               );
//                               showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return alert;
//                                   });
//                             }
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Text(
//                               'Submit',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                           color: Colors.teal,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 1.2,
//                   width: MediaQuery.of(context).size.width - 30,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: imageList.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         padding: EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient(colors: [
//                           Colors.teal,
//                           Colors.green
//                         ])),
//                         child: widget.image != null
//                             ? Image.file(
//                                 io.File(imageList[index].path),
//                                 fit: BoxFit.fitWidth,
//                               )
//                             : Container(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _buildTextField(TextEditingController controller, String labelText) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//           color: Colors.tealAccent,
//           border: Border.all(color: Colors.teal)),
//       child: TextField(
//         onChanged: (value) {
//           // testBoeNo = value;
//           // // controller.text = value;
//           // print(controller.text);
//         },
//         controller: controller,
//         style: TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(horizontal: 10),
//             labelText: labelText,
//             labelStyle: TextStyle(color: Colors.white),
//             border: InputBorder.none),
//       ),
//     );
//   }

//   Future<dynamic> _onBackPressed() {
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Do you want to extract more data?"),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, false);
//               Get.to(() => MyDashboardPage());
//             },
//             child: Text("Exit"),
//           ),
//           TextButton(
//             onPressed: () => Navigator.pop(context, false),
//             child: Text("No"),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, true);
//               buildData();
//             },
//             child: Text("Yes"),
//           ),
//         ],
//       ),
//     );
//   }

//   Future _generateCsvFile() async {
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.storage,
//     ].request();

//     io.Directory? docDirectory = await getExternalStorageDirectory();
//     String docPath = docDirectory!.path;
//     if (io.File("$docPath/" + fileNameController.text + ".csv").existsSync()) {
//       print("File Exists");
//       List<dynamic> associateList = [
//         {
//           "shipDate": dateController.text,
//           "mawb": mawbController.text,
//           "trackingNo": trackingController.text,
//           "shipRef": shipmentController.text,
//           "cth": cthController.text,
//           "exchangeRate": exchangeRateController.text,
//           "boeNo": boeNoController.text,
//           "cifValue": cifController.text,
//           "invoiceNo": invoiceNoAndDateController.text,
//           "invoiceValue": invoiceValueController.text,
//           "companyName": companyNameController.text,
//           "prNumber": productNumberController.text,
//           "description": descriptionController.text,
//           "igstValue": igstValueController.text
//         },
//       ];

//       List<List<dynamic>> rows = [];

//       List<dynamic> row = [];

//       rows.add(row);
//       for (int i = 0; i < associateList.length; i++) {
//         List<dynamic> row = [];
//         row.add(associateList[0]["shipDate"]);
//         row.add(associateList[0]["mawb"]);
//         row.add(associateList[0]["trackingNo"]);
//         row.add(associateList[0]["shipRef"]);
//         row.add(associateList[0]["cth"]);
//         row.add(associateList[0]["exchangeRate"]);
//         row.add(associateList[0]["boeNo"]);
//         row.add(associateList[0]["cifValue"]);
//         row.add(associateList[0]["invoiceNo"]);
//         row.add(associateList[0]["InvoiceValue"]);
//         row.add(associateList[0]["companyName"]);
//         row.add(associateList[0]["prNumber"]);
//         row.add(associateList[0]["description"]);
//         row.add(associateList[0]["igstValue"]);

//         rows.add(row);
//       }

//       String csv = const ListToCsvConverter().convert(rows);
//       io.File shipmentScannerCsv =
//           io.File('$docPath/' + fileNameController.text + '.csv');
//       fileLocation = "$docPath/" + fileNameController.text + ".csv";

//       shipmentScannerCsv.writeAsStringSync(csv, mode: io.FileMode.append);
//     } else {
//       List<dynamic> associateList = [
//         {
//           "shipDate": dateController.text,
//           "mawb": mawbController.text,
//           "trackingNo": trackingController.text,
//           "shipRef": shipmentController.text,
//           "cth": cthController.text,
//           "exchangeRate": exchangeRateController.text,
//           "boeNo": boeNoController.text,
//           "cifValue": cifController.text,
//           "invoiceNo": invoiceNoAndDateController.text,
//           "invoiceValue": invoiceValueController.text,
//           "companyName": companyNameController.text,
//           "prNumber": productNumberController.text,
//           "description": descriptionController.text,
//           "igstValue": igstValueController.text
//         },
//       ];

//       List<List<dynamic>> rows = [];

//       List<dynamic> row = [];
//       row.add("Ship Date");
//       row.add("MAWB");
//       row.add("Tracking Number(HAWB/BL)");
//       row.add("Ship Ref No");
//       row.add("CTH");
//       row.add("Ex-Rate");
//       row.add("BOE No.");
//       row.add("CIF Value");
//       row.add("Invoice Number and Date");
//       row.add("Invoice Value");
//       row.add("Company Name");
//       row.add("Product Number");
//       row.add("Description");
//       row.add("IGST Ass. Value");

//       rows.add(row);
//       for (int i = 0; i < associateList.length; i++) {
//         List<dynamic> row = [];
//         row.add(associateList[0]["shipDate"]);
//         row.add(associateList[0]["mawb"]);
//         row.add(associateList[0]["trackingNo"]);
//         row.add(associateList[0]["shipRef"]);
//         row.add(associateList[0]["cth"]);
//         row.add(associateList[0]["exchangeRate"]);
//         row.add(associateList[0]["boeNo"]);
//         row.add(associateList[0]["cifValue"]);
//         row.add(associateList[0]["invoiceNo"]);
//         row.add(associateList[0]["InvoiceValue"]);
//         row.add(associateList[0]["companyName"]);
//         row.add(associateList[0]["prNumber"]);
//         row.add(associateList[0]["description"]);
//         row.add(associateList[0]["igstValue"]);

//         rows.add(row);
//       }

//       String csv = const ListToCsvConverter().convert(rows);
//       io.File shipmentScannerCsv =
//           io.File('$docPath/' + fileNameController.text + '.csv');
//       fileLocation = "$docPath/" + fileNameController.text + ".csv";

//       shipmentScannerCsv.writeAsStringSync(csv, mode: io.FileMode.append);
//       print("New File");
//     }

//     print('$docPath');
//   }

//   bool validateAndSave() {
//     final form = globalFormKey.currentState;
//     if (form!.validate()) {
//       form.save();
//       return true;
//     }
//     return false;
//   }
// }

// class DynamicTextFieldWidget extends StatelessWidget {
//   TextEditingController newProductController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(border: Border.all(color: Colors.teal)),
//       child: new TextField(
//           controller: newProductController,
//           decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(horizontal: 10),
//               labelText: "Enter New Product",
//               labelStyle: TextStyle(color: Colors.white),
//               border: InputBorder.none)),
//     );
//   }
// }
