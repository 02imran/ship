import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_tracker/color.dart';

import '../utils/custom_margin.dart';
import 'dashboard_controller.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return AnimatedContainer(
            transform: Matrix4.translationValues(
                controller.xOffset, controller.yOffset, 0)
              ..scale(controller.scaleFactor)
              ..rotateY(controller.isDrawerOpen ? -0.5 : 0),
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius:
                  BorderRadius.circular(controller.isDrawerOpen ? 40 : 0.0),
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(controller.isDrawerOpen ? 40 : 0.0),
              child: Scaffold(
                bottomNavigationBar: bottomNavigation(controller, context),
                body: Stack(
                  children: [
                    controller.currentPage,
                    GestureDetector(
                      onTap: () {
                        controller.expandDrawer(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 20,
                            top: Get.height * .05,
                            right: 20,
                            bottom: 10),
                        child: Image.asset(
                          'assets/icon/menus.png',
                          height: Get.height * 0.035,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    controller.isDrawerOpen
                        ? GestureDetector(
                            onTap: () => controller.collapsDrawer(context),
                            child: Container(
                              height: Get.height,
                              width: Get.width,
                              color: Colors.transparent,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          );
        });
  }

  bottomNavigation(DashboardController controller, BuildContext context) {
    return Container(
      height: controller.isIos ? 100 : 70,
      width: Get.width,
      decoration: const BoxDecoration(
        color: Color(0xFF002E5B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            menuItem(
              isSelected: controller.selectedIndex == 0 ? true : false,
              selectedImage: 'assets/icon/fire_se.png',
              deSelectImage: 'assets/icon/fire_de.png',
              onTap: () => controller.buttomNavigationOnclick(0),
            ),
            menuItem(
              isSelected: controller.selectedIndex == 1 ? true : false,
              selectedImage: 'assets/icon/notification_se.png',
              deSelectImage: 'assets/icon/notification_de.png',
              onTap: () => controller.buttomNavigationOnclick(1),
            ),
            menuItem(
              isSelected: controller.selectedIndex == 2 ? true : false,
              selectedImage: 'assets/icon/profile_se.png',
              deSelectImage: 'assets/icon/profile_de.png',
              onTap: () => controller.buttomNavigationOnclick(2),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItem({
    required bool isSelected,
    required selectedImage,
    required deSelectImage,
    required Function() onTap,
    Color? iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isSelected
                ? Image.asset(
                    '$selectedImage',
                    height: 25,
                    color: iconColor,
                  )
                : Image.asset(
                    '$deSelectImage',
                    color: iconColor,
                    height: 25,
                  ),
            VerticalMargin10(),
            isSelected
                ? Image.asset(
                    'assets/icon/dot.png',
                    height: 6,
                  )
                : const SizedBox(
                    height: 6,
                  ),
          ],
        ),
      ),
    );
  }
}
