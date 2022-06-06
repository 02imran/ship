import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_tracker/color.dart';
import 'package:ship_tracker/screen/authentication/forgot_pass_screen/forgot_pass_controller.dart';
import 'package:ship_tracker/size_config.dart';

import '../../utils/custom_primary_button.dart';
import '../../utils/input_formfield.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FrogotPassController>(
        init: FrogotPassController(),
        builder: (controller) => Scaffold(
              backgroundColor: kPrimaryColor,
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                elevation: 0,
              ),
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: ListView(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                    const Center(
                      child: Text(
                        'LOGO',
                        style: TextStyle(fontSize: 50, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(60)),
                    const Text(
                      'Forget',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    InputFieldArea(
                      controller: controller.phoneController,
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      obscure: false,
                      hint: 'Enter your number',
                    ),
                    SizedBox(height: getProportionateScreenHeight(40)),
                    PrimaryButton(
                      onTap: () {},
                      title: 'Verify',
                      height: getProportionateScreenHeight(40),
                    ),
                  ],
                ),
              )),
            ));
  }
}
