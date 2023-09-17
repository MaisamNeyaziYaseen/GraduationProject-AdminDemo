import 'package:flutter/material.dart';

class DashboardSubsection extends StatelessWidget {
  String title;
  Function() onTap;
  DashboardSubsection({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [InkWell(onTap: onTap, child: Text(title)), Divider()],
    );
  }
}
