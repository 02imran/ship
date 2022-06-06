import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_tracker/color.dart';
import 'package:ship_tracker/screen/authentication/signup_screen/signup_controller.dart';
import 'package:ship_tracker/size_config.dart';

import '../../utils/custom_primary_button.dart';
import '../../utils/input_formfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        init: SignUpController(),
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
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    InputFieldArea(
                      controller: controller.nameEditingController,
                      icon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      obscure: false,
                      hint: 'Enter your Name',
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    InputFieldArea(
                      controller: controller.phoneEditingController,
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      obscure: false,
                      hint: 'Enter your Phone',
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    InputFieldArea(
                      controller: controller.passeditingcontroller,
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      obscure: false,
                      hint: 'Enter your Password',
                    ),
                    SizedBox(height: getProportionateScreenHeight(40)),
                    PrimaryButton(
                      onTap: () {},
                      title: 'Sign Up',
                      height: getProportionateScreenHeight(40),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    const Center(
                      child: Text(
                        'HELP',
                        style: TextStyle(
                          color: Color(
                            0xFF2969E9,
                          ),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                  ],
                ),
              )),
            ));
  }
}
