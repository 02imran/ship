import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_screen.dart';
import '../profile/profile_scree.dart';
import '../utils/appConstant.dart';

class DashboardController extends GetxController {
  bool isIos = false;

  var selectedIndex = 0;
  Widget currentPage = const HomeScreen();

  @override
  void onInit() {
    if (Platform.isIOS) {
      isIos = true;
      update();
    } else {
      isIos = false;
      update();
    }
    super.onInit();
  }

  //....draerr

  bool isLoading = false;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  void expandDrawer(BuildContext context) {
    AppConstant.hideKeyword(context);
    xOffset = 230;
    yOffset = 150;
    scaleFactor = 0.6;
    isDrawerOpen = true;

    update();
  }

  void collapsDrawer(BuildContext context) {
    AppConstant.hideKeyword(context);
    xOffset = 0;
    yOffset = 0;
    scaleFactor = 1;
    isDrawerOpen = false;
    update();
  }
  //.....

  void buttomNavigationOnclick(int index) {
    print('index $index');
    if (index == 0) {
      selectedIndex = index;
      currentPage = const HomeScreen();
      update();
    }

    if (index == 1) {
      selectedIndex = index;
      currentPage = const ProfileScreen();
      update();
    }

    if (index == 2) {
      selectedIndex = index;
      currentPage = const ProfileScreen();
      update();
    }
  }
}
