import 'package:flutter/material.dart';

class CompleteOrderDetails extends StatefulWidget {
  final document;
  CompleteOrderDetails(this.document);

  @override
  _CompleteOrderDetailsState createState() => _CompleteOrderDetailsState();
}

class _CompleteOrderDetailsState extends State<CompleteOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order Details"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.tealAccent, Colors.teal])),
          child: Card(
            elevation: 8,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Crop Name: " + widget.document['Crop'].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.teal[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Order Approved: " +
                        widget.document['Order Approved'].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Icon(
                    Icons.power_settings_new_rounded,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Order Picked: " +
                        widget.document['Order Picked'].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Icon(
                    Icons.room_rounded,
                    color: Colors.teal[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Order Delivered: " +
                        widget.document['Order Delivered'].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Icon(
                    Icons.person,
                    color: Colors.teal[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Pickup Location: " +
                        widget.document["Pickup Location"].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Icon(
                    Icons.settings_system_daydream_rounded,
                    color: Colors.teal[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Destination Address: " +
                        widget.document["Destination"].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Icon(
                    Icons.settings_system_daydream_rounded,
                    color: Colors.teal[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Expected Delivery: \n" +
                        widget.document['Expected Delivery'].toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  leading: Icon(
                    Icons.storage_rounded,
                    color: Colors.teal[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Total Weight: \n" +
                        widget.document['Total Weight'].toString() +
                        " KG",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  leading: Icon(
                    Icons.stop_circle_rounded,
                    color: Colors.teal[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Total Cost: \n" +
                        widget.document['Total Cost'].toString() +
                        " RS",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  leading: Icon(
                    Icons.stop_circle_rounded,
                    color: Colors.teal[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Payment Method: \n" + "POD",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  leading: Icon(
                    Icons.stop_circle_rounded,
                    color: Colors.teal[600],
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
