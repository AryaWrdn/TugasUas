import 'package:flutter/material.dart';
import 'package:project_uas/style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.hint,
    this.isObscure = false,
    this.haSuffix = false,
    this.onPressed,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String hint;
  final bool isObscure;
  final bool haSuffix;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        controller: controller,
        style: TextStyles.body,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        obscureText: isObscure,
        decoration: InputDecoration(
          suffixIcon: haSuffix
              ? IconButton(
                  onPressed: onPressed,
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off))
              : null,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.0,
                color: AppColors.hijauGelap,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.0,
                color: AppColors.darkGrey,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: hint,
          hintStyle: TextStyles.body,
        ),
      ),
    );
  }
}
