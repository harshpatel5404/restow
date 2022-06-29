import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final text2color;
  final text1bold;
  const TextWidget(
      {Key? key,
      this.text2color,
      this.text1bold,
      required this.text1,
      required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(
            text1,
            style: TextStyle(
              color: Color(0xff7E7E7E),
              fontSize: 13.5,
                fontWeight: text1bold ?? FontWeight.normal
            ),
          ),
          Text(
            text2,
            style: TextStyle(
                color: text2color ?? Color(0xff535353),
                fontSize: 13.5,
              ),
          ),
        ],
      ),
    );
  }
}
