import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_uas/style.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.hint,
    this.isObscure = false,
    this.haSuffix = true,
    this.onPressed,
    this.icon,
    this.isDateField = false,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String hint;
  final bool isObscure;
  final bool haSuffix;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isDateField;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        controller: widget.controller,
        style: TextStyles.body,
        keyboardType:
            widget.isDateField ? TextInputType.none : widget.textInputType,
        textInputAction: widget.textInputAction,
        obscureText: widget.isObscure,
        decoration: InputDecoration(
          prefixIcon: widget.haSuffix
              ? IconButton(
                  onPressed: widget.onPressed,
                  icon: Icon(widget.icon ??
                      (widget.isObscure
                          ? Icons.visibility_off
                          : Icons.visibility)),
                )
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
          hintText: widget.hint,
          hintStyle: TextStyles.body,
        ),
        onTap: widget.isDateField ? () => _selectDate(context) : null,
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        widget.controller.text = formattedDate;
      });
    }
  }
}
