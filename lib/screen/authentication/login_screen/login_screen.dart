import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ship_tracker/color.dart';
import 'package:ship_tracker/screen/authentication/forgot_pass_screen/forgot_pass_screen.dart';
import 'package:ship_tracker/screen/authentication/login_screen/login_controller.dart';
import 'package:ship_tracker/screen/authentication/signup_screen/signup_screen.dart';
import 'package:ship_tracker/screen/main_screen/main_screen.dart';
import 'package:ship_tracker/size_config.dart';

import '../../utils/custom_primary_button.dart';
import '../../utils/input_formfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
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
                      'Login',
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
                    SizedBox(height: getProportionateScreenHeight(30)),
                    InputFieldArea(
                      controller: controller.passwordController,
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      obscure: false,
                      hint: 'Enter your password',
                    ),
                    SizedBox(height: getProportionateScreenHeight(40)),
                    PrimaryButton(
                      onTap: () {
                        Get.to(() => MainScreen());
                      },
                      title: 'Sign in',
                      height: getProportionateScreenHeight(40),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    InkWell(
                      onTap: () {
                        Get.to(() => const ForgotPassScreen());
                      },
                      child: const Center(
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: Color(
                              0xFF2969E9,
                            ),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'New To Dnstasure ? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const SignUpScreen());
                          },
                          child: const Text(
                            'Sign Up Now',
                            style: TextStyle(
                              color: Color(0xFF2969E9),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ));
  }
}
