import 'package:flutter/material.dart';

class MyCropDetailPage extends StatefulWidget {
  final document;
  MyCropDetailPage(this.document);

  @override
  _MyCropDetailPageState createState() => _MyCropDetailPageState();
}

class _MyCropDetailPageState extends State<MyCropDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.document["Crop Name"].toString()),
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
                    "Crop Name: " + widget.document['Crop Name'].toString(),
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
                    "Land Area: " + widget.document['Land Area'].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Icon(
                    Icons.landscape_rounded,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Seeds Quantity: " +
                        widget.document['Seed Quantity'].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Icon(
                    Icons.shopping_basket,
                    color: Colors.teal[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Seed Cost: " + widget.document['Seed Price'].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Icon(
                    Icons.price_check_rounded,
                    color: Colors.teal[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Fertilizer's Cost: " +
                        widget.document["Fertilizer's Cost"].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Icon(
                    Icons.price_check_rounded,
                    color: Colors.teal[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Maintainance Cost: " +
                        widget.document["Maintainance cost"].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Icon(
                    Icons.price_check_rounded,
                    color: Colors.teal[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Expected Harvest Duration: \n" +
                        widget.document['Expected Harvest Duration'].toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  leading: Icon(
                    Icons.lock_clock_rounded,
                    color: Colors.teal[600],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Planted On: \n" + widget.document['Planed On'].toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  leading: Icon(
                    Icons.date_range_rounded,
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
