
import 'package:box_cricket/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final Color borderColor;
  final Color fillColor;
  final double borderRadius;
  final String? Function(String?)? validator; 

  const CustomInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.borderColor = AppColors.primary,
    this.fillColor = Colors.white,
    this.borderRadius = 8.0,
    this.validator, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      validator: validator, 
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        filled: true,
        fillColor: fillColor,
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: borderColor) : null,
        suffixIcon:
            suffixIcon != null
                ? GestureDetector(
                  onTap: onSuffixTap,
                  child: Icon(suffixIcon, color: borderColor),
                )
                : null,
        border: InputBorder.none,
        focusedBorder: InputBorder.none
      ),
    );
  }
}
