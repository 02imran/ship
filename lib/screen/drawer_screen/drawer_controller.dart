import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_tracker/screen/dashboard/dashboard_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import '../profile/profile_scree.dart';
import '../sign_in_screen/sign_in_screen.dart';
import '../utils/appConstant.dart';


enum DrawerItems { feed, profile, setting, contact_us, language, logout }

class DraewerController extends GetxController {
  var isLoading = false;

  final DashboardController _homeController = Get.put(DashboardController());

  @override
  void onInit() {
    super.onInit();
  }

  void drawerClickAction(
      {required DrawerItems name, required BuildContext context}) {
    if (name == DrawerItems.feed) {
      _homeController.collapsDrawer(context);
      return;
    }

    if (name == DrawerItems.profile) {
      _homeController.collapsDrawer(context);
      Get.to(() => ProfileScreen());
      return;
    }

    if (name == DrawerItems.setting) {
      _homeController.collapsDrawer(context);
      Get.to(() => ProfileScreen());
      return;
    }

    if (name == DrawerItems.contact_us) {
      _homeController.collapsDrawer(context);
      Get.to(() => ProfileScreen());
      return;
    }

    if (name == DrawerItems.language) {
      successSnackbar("Coming soon");
      return;
    }

    if (name == DrawerItems.logout) {
      AppConstant.customDialog(
          context: context,
          title: "Logout!",
          middleText: "Are you sure want to logout?",
          confirmAction: () async {
            await prefs!.clear();
            Navigator.of(context).pop();
            Get.offAll(() => ProfileScreen());
          });
      return;
    }
  }

  void logoutAction(BuildContext context) async {
    AppConstant.customDialog(
        context: context,
        title: "Logout!",
        middleText: "Are you sure want to logout?",
        confirmAction: () async {
          await prefs!.clear();
          Navigator.of(context).pop();
          Get.offAll(() => const SignInScreen());
        });
  }

  websiteOnClick() async {
    if (!await launch('https://thegrowapp.se/')) throw 'Could not launch ';
  }

  instagramOnClick() async {
    const nativeUrl = "instagram://user?username=thegrowapplication";
    const webUrl = "https://www.instagram.com/thegrowapplication/";
    if (await canLaunch(webUrl)) {
      await launch(
        nativeUrl,
      );
    } else if (await canLaunch(
      webUrl,
    )) {
      await launch(webUrl);
    } else {
      print("can't open Instagram");
    }
  }

  void fbOnClick(String url, String fallbackUrl) async {
    // Don't use canLaunch because of fbProtocolUrl (fb://)

    successSnackbar("cooming soon");

    // try {
    //   bool launched =
    //       await launch(url, forceSafariVC: false, forceWebView: false);
    //   if (!launched) {
    //     await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    //   }
    // } catch (e) {
    //   await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    // }
  }
}
