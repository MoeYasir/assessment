import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final FontWeight fontWeight;
  final Color color;
  const DrawerItem(
      {Key? key,
      required this.text,
      this.icon = Icons.home_work_outlined,
      this.color = const Color(0xff888888),
      this.fontWeight = FontWeight.w200})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40,
          color: color,
        ),
        Gap(10),
        Text(
          text,
          style: TextStyle(fontWeight: fontWeight, color: color),
        )
      ],
    );
  }
}
