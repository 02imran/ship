import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerticalMargin20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Get.height * 0.02);
  }
}

class VerticalMargin30 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Get.height * 0.03);
  }
}

class VerticalMargin10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Get.height * 0.01);
  }
}

class HorizontalMargin10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: Get.height * 0.01);
  }
}

class HorizontalMargin20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: Get.height * 0.02);
  }
}

class HorizontalMargin30 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: Get.height * 0.03);
  }
}
