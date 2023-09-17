import 'package:admin_demo/controller/order_controller.dart';
import 'package:admin_demo/controller/ui_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersBody extends StatelessWidget {
  OrdersBody({super.key});

  UiController _uiController = Get.find(tag: "ui_controller");
  OrderController _orderController = Get.find(tag: "order_controller");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: TextField(
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Obx(
                    () => Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(3)),
                        child: DropdownButton<String>(
                          hint: Text("filter"),
                          value: _uiController.getProductsFilter == "non"
                              ? null
                              : _uiController.getProductsFilter,
                          items: [
                            for (String value in [
                              "non",
                              "delivered",
                              "not delivered",
                              "payed",
                              "not payed"
                            ])
                              DropdownMenuItem(
                                  value: value, child: Text(value)),
                          ],
                          onChanged: (value) {
                            _uiController.setProductsFilter(value!);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85 / 5.0 -
                      20.0 / 5.0 -
                      24 / 5,
                  child: Text(
                    "ID",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85 / 5.0 -
                      20.0 / 5.0 -
                      24 / 5,
                  child: Text(
                    "Date",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85 / 5.0 -
                      20.0 / 5.0 -
                      24 / 5,
                  child: Text(
                    "User",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85 / 5.0 -
                      20.0 / 5.0 -
                      24 / 5,
                  child: Text(
                    "Delivery State",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85 / 5.0 -
                      20.0 / 5.0 -
                      24 / 5,
                  child: Text(
                    "Payment State",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: ListView.builder(
                  itemCount: _orderController.getOrdersList.length,
                  itemBuilder: (c, i) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width *
                                        0.85 /
                                        5.0 -
                                    20.0 / 5.0 -
                                    24 / 5,
                                child: Text(
                                  _orderController.getOrdersList[i].id!
                                      .toJson(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                        0.85 /
                                        5.0 -
                                    20.0 / 5.0 -
                                    24 / 5,
                                child: Text(
                                  "${_orderController.getOrdersList[i].date!.day}-${_orderController.getOrdersList[i].date!.month}-${_orderController.getOrdersList[i].date!.year}",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                        0.85 /
                                        5.0 -
                                    20.0 / 5.0 -
                                    24 / 5,
                                child: Text(
                                  "${_orderController.getOrdersList[i].user!['first_name']} ${_orderController.getOrdersList[i].user!['last_name']}",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                        0.85 /
                                        5.0 -
                                    20.0 / 5.0 -
                                    24 / 5,
                                child: Text(
                                  _orderController
                                      .getOrdersList[i].deliveryState!,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                        0.85 /
                                        5.0 -
                                    20.0 / 5.0 -
                                    24 / 5,
                                child: Text(
                                  _orderController
                                      .getOrdersList[i].paymentState!,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Icon(
                                Icons.more_vert,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
