import 'package:athaar_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final bool active;

  const DotIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: active ? 20 : 10,
      decoration: BoxDecoration(
        color: active ? AppColors.primaryColor : AppColors.lightGrayColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
