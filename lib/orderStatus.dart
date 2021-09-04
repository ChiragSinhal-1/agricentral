import 'package:agricentral/completeOrderDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatus extends StatefulWidget {
  final document;
  OrderStatus(this.document);

  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  void initState() {
    repeater();
    super.initState();
  }

  void repeater() {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        repeater();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Order Status"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(10, 40, 10, 10)),
              Center(
                child: Text(
                  "Order#001",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: widget.document["Order Approved"] == "False"
                            ? Colors.grey
                            : Colors.teal,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: widget.document["Order Approved"] == "False"
                            ? Colors.grey
                            : Colors.teal,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: widget.document["Order Approved"] == "False"
                            ? Colors.grey
                            : Colors.teal,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: widget.document["Order Approved"] == "False"
                            ? Colors.grey
                            : Colors.teal,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: widget.document["Order Approved"] == "False"
                            ? Colors.grey
                            : Colors.teal,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: widget.document["Order Picked"] == "False"
                            ? Colors.grey
                            : Colors.teal,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: widget.document["Order Picked"] == "False"
                            ? Colors.grey
                            : Colors.teal,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: widget.document["Order Picked"] == "False"
                            ? Colors.grey
                            : Colors.teal,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: widget.document["Order Picked"] == "False"
                            ? Colors.grey
                            : Colors.teal,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: widget.document["Order Picked"] == "False"
                            ? Colors.grey
                            : Colors.teal,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: widget.document["Order Delivered"] == "False"
                            ? Colors.grey
                            : Colors.teal,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  widget.document["Order Approved"] == "False"
                      ? Text(
                          "Recieved",
                          style: TextStyle(color: Colors.grey),
                        )
                      : Text("Recieved", style: TextStyle(color: Colors.teal)),
                  widget.document["Order Picked"] == "False"
                      ? Text(
                          "In Transit",
                          style: TextStyle(color: Colors.grey),
                        )
                      : Text("In Transit",
                          style: TextStyle(color: Colors.teal)),
                  widget.document["Order Delivered"] == "False"
                      ? Text(
                          "Delivered",
                          style: TextStyle(color: Colors.grey),
                        )
                      : Text("Delivered", style: TextStyle(color: Colors.teal)),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Image(
                  image: widget.document["order status"] == "pending"
                      ? AssetImage("undraw_pending_approval_xuu9.png")
                      : widget.document["order status"] == "Approved"
                          ? AssetImage("undraw_Order_confirmed_re_g0if.png")
                          : widget.document["order status"] == "In Transit"
                              ? AssetImage("undraw_On_the_way_re_swjt.png")
                              : AssetImage(
                                  "undraw_Order_delivered_re_v4ab.png")),
              SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => CompleteOrderDetails(widget.document));
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "View More Details",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.tealAccent, Colors.teal]),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
