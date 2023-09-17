import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({super.key});

  List<int> _testList = [
    1,
    1,
    1,
    1,
    11,
    1,
    11,
    1,
    1,
    1,
    11,
    1,
    1,
    1,
    1,
    1,
    1,
    11,
    1,
    1,
    1,
    1,
  ];

  Widget _builuserInfoHolder(BuildContext context, String field, String value) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width * 0.3,
      child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.3 * 0.2,
              child: Text(
                "$field:",
                style: TextStyle(
                  color: Colors.grey,
                ),
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.3 * 0.8,
              child: Text(value))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Information",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Username:",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "First Name:",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Last Name:",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Email:",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Number:",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              for (int i = 0; i < 5; i++)
                                Text(
                                  "value",
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Details",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Order ID:"),
                        SizedBox(
                          width: 20,
                        ),
                        Text("order ID"),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text("Order Date:"),
                        SizedBox(
                          width: 20,
                        ),
                        Text("order date"),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text("Delivery State:"),
                        SizedBox(
                          width: 20,
                        ),
                        Text("state"),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text("Payment State:"),
                        SizedBox(
                          width: 20,
                        ),
                        Text("state"),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Products",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    for (int i in _testList)
                      Column(
                        children: [
                          Container(
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: (MediaQuery.of(context).size.width -
                                              60.0) /
                                          3.0 -
                                      20.0 / 3.0,
                                  child: Text(
                                    "ID",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: (MediaQuery.of(context).size.width -
                                              60.0) /
                                          3.0 -
                                      20.0 / 3.0,
                                  child: Text(
                                    "Title",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  width: (MediaQuery.of(context).size.width -
                                              60.0) /
                                          3.0 -
                                      20.0 / 3.0,
                                  child: Text(
                                    "Price",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
