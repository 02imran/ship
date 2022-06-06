import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.title,
      this.height,
      this.width,
      this.fontSize,
      required this.onTap})
      : super(key: key);
  final String title;
  final double? height;
  final double? width;
  final double? fontSize;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: const Color(0xFF002E5B),
        ),
        width: width ?? double.infinity,
        height: height ?? 60.0,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                //  letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
                fontSize: fontSize ?? 16),
          ),
        ),
      ),
    );
  }
}
