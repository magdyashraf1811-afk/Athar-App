import 'dart:ui';

import 'package:athaar_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';
import '../../../utils/app_colors.dart';

class HorusBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const HorusBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final isDark = themeProvider.isDarkMode();
    final gold = isDark ? AppColors.gold : AppColors.darkGold;
    final inactiveColor = isDark
        ? AppColors.inactiveDark
        : AppColors.inactiveLight;
    final backgroundColors = isDark
        ? [
            AppColors.glassDarkBlue.withOpacity(0.30),
            AppColors.navy.withOpacity(0.38),
            AppColors.glassDeepBlue.withOpacity(0.32),
          ]
        : [
            AppColors.glassWhite.withOpacity(0.32),
            AppColors.glassWarmWhite.withOpacity(0.40),
            AppColors.glassBeige.withOpacity(0.32),
          ];
    return Padding(
      padding: EdgeInsets.only(
        right: width * 0.03,
        left: width * 0.03,
        bottom: height * 0.03,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
          child: Container(
            height: 82,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: backgroundColors,
              ),
              border: Border.all(
                color: gold.withOpacity(isDark ? 0.90 : 0.80),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: gold.withOpacity(isDark ? 0.22 : 0.15),
                  blurRadius: 14,
                  spreadRadius: 0.5,
                ),
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(isDark ? 0.30 : 0.08),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 25,
                  right: 25,
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.transparentColor,
                          AppColors.whiteColor.withOpacity(
                            isDark ? 0.20 : 0.45,
                          ),
                          AppColors.transparentColor,
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    _buildItem(
                      index: 0,
                      label: AppLocalizations.of(context)!.home,
                      icon: Icons.home_rounded,
                      gold: gold,
                      inactiveColor: inactiveColor,
                      isDark: themeProvider.isDarkMode(),
                    ),
                    _buildItem(
                      index: 1,
                      label: AppLocalizations.of(context)!.tickets,
                      icon: Icons.confirmation_number_rounded,
                      gold: gold,
                      inactiveColor: inactiveColor,
                      isDark: themeProvider.isDarkMode(),
                    ),
                    _buildItem(
                      index: 2,
                      label: AppLocalizations.of(context)!.horus,
                      isHorus: true,
                      gold: gold,
                      inactiveColor: inactiveColor,
                      isDark: themeProvider.isDarkMode(),
                    ),
                    _buildItem(
                      index: 3,
                      label: AppLocalizations.of(context)!.profile,
                      icon: Icons.person_rounded,
                      gold: gold,
                      inactiveColor: inactiveColor,
                      isDark: themeProvider.isDarkMode(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem({
    required int index,
    required String label,
    IconData? icon,
    required Color gold,
    required Color inactiveColor,
    required bool isDark,
    bool isHorus = false,
  }) {
    final isSelected = selectedIndex == index;
    final itemColor = isSelected ? gold : inactiveColor;
    return Expanded(
      child: GestureDetector(
        onTap: () => onItemSelected(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              width: 44,
              height: 39,
              decoration: BoxDecoration(
                color: isSelected
                    ? gold.withOpacity(isDark ? 0.13 : 0.12)
                    : AppColors.transparentColor,
                shape: BoxShape.circle,
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: gold.withOpacity(0.22),
                          blurRadius: 14,
                          spreadRadius: 1,
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: isHorus
                    ? Image.asset(
                        'assets/icons/horus_icon.png',
                        width: 45,
                        height: 45,
                        color: itemColor,
                      )
                    : Icon(icon, size: 29, color: itemColor),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: itemColor,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              width: isSelected ? 30 : 0,
              height: 2.5,
              decoration: BoxDecoration(
                color: gold,
                borderRadius: BorderRadius.circular(10),
                boxShadow: isSelected
                    ? [BoxShadow(color: gold.withOpacity(0.65), blurRadius: 8)]
                    : [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
