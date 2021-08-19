import 'package:flutter/material.dart';

class MyDashboardPage extends StatefulWidget {
  const MyDashboardPage({Key? key}) : super(key: key);

  @override
  _MyDashboardPageState createState() => _MyDashboardPageState();
}

class _MyDashboardPageState extends State<MyDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
    );
  }
}
