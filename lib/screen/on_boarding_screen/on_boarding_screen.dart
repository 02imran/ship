import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ship_tracker/screen/authentication/login_screen/login_screen.dart';
import 'package:ship_tracker/size_config.dart';

import '../utils/over_boaed.dart';
import '../utils/page_model.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final _pageList = [
    PageModel(
        color: const Color(0xFF75CCF1),
        imageAssetPath: 'assets/images/orders.png',
        title: 'Quality Products',
        
        body:
            'Quality Products And from here, you can only go forward, shopping',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF75CCF1),
        imageAssetPath: 'assets/images/orders.png',
        title: 'Add to Cart and Pay',
      
        body:
            'Add the product to shopping cart, choose delivery and then pay with your preferences payment',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF75CCF1),
       
        imageAssetPath: 'assets/images/orders.png',
        title: 'Payment',
        body:
            'Wait until the product that has been purchased comes to the house',
        doAnimateImage: true),
  ];

  @override
  void initState() {
    // start recording lifecycle
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
    super.didChangeAppLifecycleState(state);
  }

  // if user click finish, you won't see this page again until you clear your data of this apps in your phone setting
  void _finishOnboarding() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('onBoarding', false);
  }

  @override
  void dispose() {
    // stop recording lifecycle
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: OverBoard(
      pages: _pageList,
      showBullets: true,
      finishCallback: () {
        _finishOnboarding();
        // after you click finish, direct to signin page
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>  LoginScreen()),
            (Route<dynamic> route) => false);
      },
    ));
  }
}
