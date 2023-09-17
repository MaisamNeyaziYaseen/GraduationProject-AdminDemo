import 'package:admin_demo/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  Product product;
  ProductDetails({super.key, required this.product});

  Widget _buildItemInfoWidget(String title, String value) {
    return Column(
      children: [
        Row(
          children: [
            Text("$title:  "),
            Text(
              value,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5 - 15,
                      height: 300,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ID:"),
                              Text("Title:"),
                              Text("Type:"),
                              Text("Gender:"),
                              Text("Age:"),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.id!.toJson(),
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                product.title!,
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                product.type!,
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                product.gender!.toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                              Row(
                                children: [
                                  for (String age in product.age!)
                                    Text("$age ",
                                        style: TextStyle(color: Colors.grey)),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.5 - 15,
                      height: 300,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description:",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            product.description!,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 3,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Items:",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      for (int i = 0; i < product.items!.length; i++)
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 3),
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          height: 430,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.withOpacity(0.1)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            0.15 -
                                        ((20 + 20 + 20 + 20) / 3),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            0.85 /
                                            2.0 -
                                        ((20 + 20 + 20 + 20) / 3),
                                    child: Text("General:"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            0.85 /
                                            2.0 -
                                        ((20 + 20 + 20 + 20) / 3),
                                    child: Text("Details:"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            0.15 -
                                        ((20 + 20 + 20 + 20) / 3),
                                    height: 100,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            0.85 /
                                            2.0 -
                                        ((20 + 20 + 20 + 20) / 3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildItemInfoWidget("On Sale:",
                                            "${product.items![i].onSale}"),
                                        _buildItemInfoWidget("Sale Factor:",
                                            "${product.items![i].saleFactor}"),
                                        _buildItemInfoWidget("Price:",
                                            "${product.items![i].price}"),
                                        _buildItemInfoWidget("Quantity:",
                                            "${product.items![i].quantity}"),
                                        _buildItemInfoWidget("State:",
                                            "${product.items![i].state}"),
                                        _buildItemInfoWidget("Is Try-On:",
                                            "${product.items![i].onSale}"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Align(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                              0.85 /
                                              2.0 -
                                          ((20 + 20 + 20 + 20) / 3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildItemInfoWidget(
                                              "UV Protection",
                                              product.items![i].details!
                                                  .uvProtection!),
                                          _buildItemInfoWidget(
                                              "Frame Color",
                                              product.items![i].details!
                                                  .frameColor!),
                                          _buildItemInfoWidget(
                                              "Frame Color code",
                                              product.items![i].details!
                                                  .frameColorCode!),
                                          _buildItemInfoWidget(
                                              "Lens Color",
                                              product.items![i].details!
                                                  .lensColor!),
                                          _buildItemInfoWidget(
                                              "Lens Color Code",
                                              product.items![i].details!
                                                  .lensColorCode!),
                                          _buildItemInfoWidget(
                                              "Frame Shape",
                                              product.items![i].details!
                                                  .frameShape!),
                                          _buildItemInfoWidget(
                                              "Frame Type",
                                              product.items![i].details!
                                                  .frameType!),
                                          _buildItemInfoWidget(
                                              "Frame Material",
                                              product.items![i].details!
                                                  .frameMaterial!),
                                          _buildItemInfoWidget(
                                              "Frame Finish",
                                              product.items![i].details!
                                                  .frameFinidh!),
                                          _buildItemInfoWidget(
                                              "Lens Finish",
                                              product.items![i].details!
                                                  .lensFinish!),
                                          _buildItemInfoWidget(
                                              "Frame Width",
                                              product.items![i].details!
                                                  .frameWidth!),
                                          _buildItemInfoWidget(
                                              "Lens Width",
                                              product.items![i].details!
                                                  .lensWidth!),
                                          _buildItemInfoWidget(
                                              "Lens Height",
                                              product.items![i].details!
                                                  .lensHeight!),
                                          _buildItemInfoWidget(
                                              "Temple Length",
                                              product.items![i].details!
                                                  .templeLength!),
                                          _buildItemInfoWidget(
                                              "Nose Bridge",
                                              product.items![i].details!
                                                  .noseBridge!),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
