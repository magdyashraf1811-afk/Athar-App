import 'package:athaar_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  Color? borderSideColor;
  Color? fillColor;
  bool? filled;

  String? hintText;
  TextStyle? hintStyle;
  String? labelText;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  int? maxLines;

  CustomTextFormField({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.borderSideColor,
    this.maxLines,
    this.fillColor,
    this.filled,
    this.hintStyle,
    this.hintText,
    this.labelStyle,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        enabledBorder: builtDecorationBorder(
          borderColor: borderSideColor ?? AppColors.transparentColor,
        ),
        focusedBorder: builtDecorationBorder(
          borderColor: borderSideColor ?? AppColors.transparentColor,
        ),
        errorBorder: builtDecorationBorder(borderColor: AppColors.redColor),
        focusedErrorBorder: builtDecorationBorder(
          borderColor: AppColors.redColor,
        ),
        fillColor: fillColor,
        filled: filled,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }

  OutlineInputBorder builtDecorationBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 2, color: borderColor),
    );
  }
}
