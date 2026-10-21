import 'package:athaar_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback onPressed;

  Widget child;

  Color? backgroundColor;
  Color? borderSideColor;

  CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderSideColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.transparentColor,
        padding: EdgeInsets.symmetric(vertical: height * 0.01),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          side: BorderSide(
            width: 1,
            color: borderSideColor ?? AppColors.transparentColor,
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
