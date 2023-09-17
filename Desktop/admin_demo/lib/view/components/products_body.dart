import 'package:admin_demo/controller/product_controller.dart';
import 'package:admin_demo/models/item.dart';
import 'package:admin_demo/models/product.dart';
import 'package:admin_demo/utils/ui_constants.dart';
import 'package:admin_demo/view/main_screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsBody extends StatefulWidget {
  const ProductsBody({super.key});

  @override
  State<ProductsBody> createState() => _ProductsBodyState();
}

class _ProductsBodyState extends State<ProductsBody> {
  ProductController _productController = Get.find(tag: "product_controller");

  @override
  void initState() {
    super.initState();
  }

  int _calculateQuantity(Product product) {
    int qty = 0;
    for (Item item in product.items!) {
      qty += item.quantity!;
    }
    return qty;
  }

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
                  SizedBox(
                    width: 10,
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
                          value: UiConstants.uiController.getProductsFilter ==
                                  "non"
                              ? null
                              : UiConstants.uiController.getProductsFilter,
                          items: [
                            for (String value in ["non", "enabled", "disabled"])
                              DropdownMenuItem(
                                  value: value, child: Text(value)),
                          ],
                          onChanged: (value) {
                            UiConstants.uiController.setProductsFilter(value!);
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
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.85 / 5.0 -
                      20.0 / 5.0 -
                      24 / 5,
                  child: Text(
                    "Product",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
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
                    "Total Quantity",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85 / 5.0 -
                      20.0 / 5.0 -
                      24 / 5,
                  child: Text(
                    "Primary Price",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85 / 5.0 -
                      20.0 / 5.0 -
                      24 / 5,
                  child: Text(
                    "Sales",
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
                  itemCount: _productController.getProductsList.length,
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
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width *
                                        0.85 /
                                        5.0 -
                                    20.0 / 5.0 -
                                    24 / 5,
                                child: Image(
                                  // width: 100,
                                  image: AssetImage(_productController
                                      .getProductsList[i]
                                      .items![0]
                                      .imgUrls![0]),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width *
                                        0.85 /
                                        5.0 -
                                    20.0 / 5.0 -
                                    24 / 5,
                                child: Text(
                                  _productController.getProductsList[i].id!
                                      .toJson(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width *
                                        0.85 /
                                        5.0 -
                                    20.0 / 5.0 -
                                    24 / 5,
                                child: Text(
                                  "${_calculateQuantity(_productController.getProductsList[i])}",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width *
                                        0.85 /
                                        5.0 -
                                    20.0 / 5.0 -
                                    24 / 5,
                                child: Text(
                                  "${_productController.getProductsList[i].items![0].price!.toStringAsFixed(2)}JD",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width *
                                        0.85 /
                                        5.0 -
                                    20.0 / 5.0 -
                                    24 / 5,
                                child: Text(
                                  "Sales",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => SimpleDialog(
                                            children: [
                                              SimpleDialogOption(
                                                onPressed: () {
                                                  //go to product details
                                                  Get.to(() => ProductDetails(
                                                      product: _productController
                                                          .getProductsList[i]));
                                                },
                                                child: Text("View Details"),
                                              ),
                                              SimpleDialogOption(
                                                onPressed: () {
                                                  //go to edit product
                                                },
                                                child: Text("Edit Product"),
                                              ),
                                              SimpleDialogOption(
                                                onPressed: () {
                                                  //delete product
                                                },
                                                child: Text("Delete Products"),
                                              ),
                                            ],
                                          ));
                                },
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.grey,
                                ),
                              )
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
