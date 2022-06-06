import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/custom_background.dart';
import '../utils/custom_margin.dart';
import '../utils/custom_progress_screen.dart';
import 'drawer_controller.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DraewerController>(
        init: DraewerController(),
        builder: (controller) => CustomProgress(
            isLoading: controller.isLoading,
            child: Scaffold(
                backgroundColor: Colors.amber,
                body: CustomBackground(
                  imagepath: 'assets/images/8-min.jpg',
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50.0, left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: Get.height * 0.07,
                                width: Get.height * 0.07,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: "",
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      "assets/images/orders.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'adnan',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Color(0xffFCC201),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('email',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          drawerItem(controller, context),
                          VerticalMargin30(),
                          VerticalMargin30(),
                          VerticalMargin30(),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                SocialIcon(
                                  onTap: () => controller.websiteOnClick(),
                                  imagePath: 'assets/drawer_icon/globe.png',
                                ),
                                HorizontalMargin30(),
                                SocialIcon(
                                  onTap: () => controller.fbOnClick(
                                      'fb://profile/408834569303957',
                                      'https://www.facebook.com/dorockxl'),
                                  // onTap: () => _controller.fbOnClick("jewel"),
                                  imagePath: 'assets/drawer_icon/fb.png',
                                ),
                                HorizontalMargin30(),
                                SocialIcon(
                                  onTap: () => controller.instagramOnClick(),
                                  imagePath: 'assets/drawer_icon/instagram.png',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ))));
  }

  Padding drawerItem(DraewerController controller, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.06),
          drawerRow(
            name: "Feed",
            iconPath: 'assets/drawer_icon/feed.png',
            onTap: () => controller.drawerClickAction(
                name: DrawerItems.feed, context: context),
          ),
          drawerRow(
            name: "Profile",
            iconPath: 'assets/drawer_icon/user.png',
            onTap: () => controller.drawerClickAction(
                name: DrawerItems.profile, context: context),
          ),
          drawerRow(
            name: "Settings",
            iconPath: 'assets/icon/setting-2.png',
            onTap: () => controller.drawerClickAction(
                name: DrawerItems.setting, context: context),
          ),
          drawerRow(
            name: "Contact us",
            iconPath: 'assets/drawer_icon/call.png',
            onTap: () => controller.drawerClickAction(
                name: DrawerItems.contact_us, context: context),
          ),
          drawerRow(
            name: 'Language',
            iconPath: 'assets/drawer_icon/language.png',
            onTap: () => controller.drawerClickAction(
                name: DrawerItems.language, context: context),
          ),
          drawerRow(
            name: "Log Out",
            iconPath: 'assets/drawer_icon/exit.png',
            onTap: () => controller.drawerClickAction(
                name: DrawerItems.logout, context: context),
          ),
        ],
      ),
    );
  }

  Widget drawerRow({
    String? name,
    String? iconPath,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(top: 20),
        margin: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            SizedBox(
              height: 25,
              width: 25,
              child: Image.asset(
                iconPath!,
                height: 25,
                width: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(width: Get.width * 0.06),
            Column(
              children: [
                Text(
                  name!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String imagePath;
  final Function() onTap;
  const SocialIcon({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imagePath,
        height: 30,
        color: Colors.white,
      ),
    );
  }
}
