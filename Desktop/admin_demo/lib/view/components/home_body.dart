import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("width: ${MediaQuery.of(context).size.width}"),
          Text("height: ${MediaQuery.of(context).size.height}"),
        ],
      ),
    );
  }
}
