import 'package:flutter/material.dart';

class CropHealthPage extends StatefulWidget {
  const CropHealthPage({Key? key}) : super(key: key);

  @override
  _CropHealthPageState createState() => _CropHealthPageState();
}

class _CropHealthPageState extends State<CropHealthPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Crop Health"),
          centerTitle: true,
        ),
      ),
    );
  }
}
