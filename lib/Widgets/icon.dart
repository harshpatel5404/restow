import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  const AppIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(width: 0, color: Colors.white)),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(Get.width * 0.02),
        child: Icon(
          icon,
          color: Colors.black,
          size: 28,
        ),
      ),
    );
  }
}
