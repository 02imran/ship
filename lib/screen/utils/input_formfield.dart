import 'package:flutter/material.dart';
import 'package:ship_tracker/color.dart';

class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final Widget icon;

  final TextEditingController? controller;
  // ignore: use_key_in_widget_constructors
  const InputFieldArea(
      {required this.hint,
      required this.obscure,
      required this.icon,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return (Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Colors.white24,
            ),
          ),
        ),
        child: TextFormField(
          obscureText: obscure,
          controller: controller,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            counterText: "",
            fillColor: Colors.white,
            hintText: hint,
            filled: true,
            labelStyle: const TextStyle(color: kTextColor),
            contentPadding: const EdgeInsets.fromLTRB(15, 12, 12, 10),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(
                    style: BorderStyle.solid, color: Colors.white)),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            suffixIcon: icon,
          ),
        )));
  }
}
