import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConstant {
  //......... Share preference .........//

  // ignore: non_constant_identifier_names
  static const USER_TOKEN = "USER_TOKEN";

  // ignore: non_constant_identifier_names
  static const USER_ID = "USERID";

  static const Image = "USERID";

  static const USER_NAME = "USER_NAME";
  // ignore: non_constant_identifier_names
  static final USER_EMAIL = "USER_EMAIL";

  // ignore: non_constant_identifier_names
  static const LAT = "LAT";
  // ignore: non_constant_identifier_names
  static const LONG = "LONG";

  // ......... drawer key.............. //
  // ignore: non_constant_identifier_names
  static const ORDERS = "Orders";

  // ignore: non_constant_identifier_names
  static const PhoneNumber = "Phone";
  // ignore: non_constant_identifier_names

  static const NOTIFICATIONS = "Notifications";
  // ignore: non_constant_identifier_names
  static final errorText = "\"success\":false";

  //........... demo..............
  // static var demoList = [
  //   'assets/demo/1.jpg',
  //   'assets/demo/flickr-marco-verch.jpg',
  //   'assets/demo/photo-1607619056574-7b8d3ee536b2.jpeg'
  // ];

  // .............. SHARED PREFERENCE KEY ..............//

  // phone number
  static const phoneNumberKey = "phoneNumberKey";
  // name
  static const nameKey = "nameKey";

  var automationTest = "Automation";

  static const companyNumber = "1234567890";

  static String? firebaseToken = '';

   static const currencySymbol = '\$';

  static void launchURL(_url) async {
    // ignore: deprecated_member_use
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  static void customDialog(
      {required BuildContext context,
      required String title,
      required String middleText,
      required Function() confirmAction,
      String? confirmButtonText}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Text(middleText),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(confirmButtonText ?? "Yes"),
              onPressed: confirmAction,
            ),
          ],
        );
      },
    );
  }

  static getFormatedDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(_date.toString());
    var outputFormat = DateFormat('dd MMM, yyyy hh:mm a');
    return outputFormat.format(inputDate);
  }

  static void hideKeyword(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }
}

SnackbarController errorSnackbar(String msg) {
  return Get.snackbar('Error', msg,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white);
}

SnackbarController successSnackbar(String msg) {
  return Get.snackbar('Success', toBeginningOfSentenceCase(msg).toString(),
      snackPosition: SnackPosition.TOP, backgroundColor: Colors.green[70]);
}
