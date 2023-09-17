import 'package:flutter/material.dart';

class DashboardSection extends StatelessWidget {
  final IconData leading;
  final String section;
  final bool isEnabled;
  Function() onTap;

  DashboardSection(
      {super.key,
      required this.leading,
      required this.section,
      this.isEnabled = true,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Icon(leading),
          title: Text(
            section,
            style: TextStyle(color: isEnabled ? Colors.black : Colors.grey),
          ),
        ),
        Divider(),
      ],
    );
  }
}
