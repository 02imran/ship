import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key, required this.child, this.imagepath})
      : super(key: key);
  final Widget child;
  final String? imagepath;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        imagepath ?? 'assets/bg/login.png',
        width: Get.width,
        height: Get.height,
        fit: BoxFit.cover,
      ),
      child
    ]);
  }
}
