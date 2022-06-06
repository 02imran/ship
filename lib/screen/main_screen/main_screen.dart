import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_tracker/screen/dashboard/dashboard_controller.dart';
import 'package:ship_tracker/screen/dashboard/dashboard_screen.dart';

import '../drawer_screen/drawer_screen.dart';

class MainScreen extends StatelessWidget {
  final _controller = Get.put(DashboardController());

  MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // close drawer if drawer is open
        if (_controller.isDrawerOpen) {
          _controller.collapsDrawer(context);
          return false;
        }

        // close app
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: [const DrawerScreen(), const DashBoardScreen()],
        ),
      ),
    );
  }
}
