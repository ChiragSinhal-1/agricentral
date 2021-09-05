// import 'dart:io';
// import 'drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:firebase_ml_vision/firebase_ml_vision.dart';

// import 'extractedText.dart';

// // ignore: camel_case_types
// class scannerPage extends StatefulWidget {
//   scannerPage({Key? key, required this.title, required this.isFirst})
//       : super(key: key);
//   final String title;
//   final bool isFirst;

//   @override
//   _scannerPageState createState() => _scannerPageState();
// }

// // ignore: camel_case_types
// class _scannerPageState extends State<scannerPage> {
//   late SharedPreferences sharedPreferences;
//   String _text = '';
//   late PickedFile _image;
//   final picker = ImagePicker();
//   bool isNotFirst = false;
//   @override
//   void initState() {
//     initial().whenComplete(() {
//       setState(() {});
//     });
//     isNotFirst = !widget.isFirst;
//     super.initState();
//   }

//   initial() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Scanner"),
//         centerTitle: true,
//       ),
//       drawer: DrawerWidget(),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           gradient:
//               LinearGradient(colors: [Colors.teal, Colors.green]),
//         ),
//         child: Column(
//           children: <Widget>[
//             new Container(
//               padding: EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 gradient: LinearGradient(
//                     colors: [Colors.tealAccent, Colors.teal]),
//               ),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15)),
//                 elevation: 8,
//                 child: ListTile(
//                   onTap: () {
//                     scanText();
//                   },
//                   title: Text(
//                     "Tap if you clicked the Picture",
//                     style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.tealAccent),
//                     textAlign: TextAlign.center,
//                   ),
//                   contentPadding: EdgeInsets.all(20),
//                 ),
//               ),
//             ),
//             new SizedBox(
//               height: 20,
//             ),
//             new Container(
//               child: _image != null
//                   ? Image.file(
//                       File(_image.path),
//                       fit: BoxFit.fitWidth,
//                     )
//                   : InkWell(
//                       child: Image(
//                         image: AssetImage("assets/selectImage.png"),
//                         fit: BoxFit.fill,
//                       ),
//                       onTap: () {
//                         // getImage();
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//       //   // floatingActionButton: FloatingActionButton(
//       //     backgroundColor: Colors.tealAccent,
//       //     // onPressed: getImage,
//       //     child: Icon(Icons.add_a_photo),
//       //     elevation: 8,
//       //   ),
//     );
//   }

//   Future scanText() async {
//     // print("tapped");
//     showDialog(
//         builder: (context) => Center(
//               child: CircularProgressIndicator(),
//             ),
//         context: context);
//     // final FirebaseVisionImage visionImage =
//     //     FirebaseVisionImage.fromFile(File(_image.path));
//     // final TextRecognizer textRecognizer =
//     //     FirebaseVision.instance.textRecognizer();
//     // final VisionText visionText =
//     //     await textRecognizer.processImage(visionImage);

//     // for (TextBlock block in visionText.blocks) {
//     // for (TextLine line in block.lines) {
//     // _text += line.text + '\n';

//     // we can apply regex to "_text" and place the required values inside of a list/dictionary.
//     // and then pass that list/dictionary to next page.
//     // and update the values of those elements when there is any change in the text field of other page.
//   }
// }

//   //   if (!isNotFirst) {
//   //     Navigator.of(context).pop();
//   //     Navigator.of(context).push(MaterialPageRoute(
//   //         builder: (context) => extractedTextScreen(_text, _image)));
//   //   } else {
//   //     Navigator.pop(context);
//   //     Navigator.pop(context, [_image, _text]);
//   //   }
//   // }

//   // 
  

