import 'package:athaar_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../providers/app_theme_provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.04,
          ),
          child: Column(
            spacing: 20,
            children: [
              Column(
                spacing: height * 0.02,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    decoration: BoxDecoration(
                      color: themeProvider.isDarkMode()
                          ? AppColors.transparentColor
                          : AppColors.whiteColor,
                      border: Border.all(
                        color: themeProvider.isDarkMode()
                            ? AppColors.whiteColor
                            : AppColors.whiteColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          themeProvider.isDarkMode()
                              ? AppLocalizations.of(context)!.dark_mode
                              : AppLocalizations.of(context)!.light_mode,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Switch(
                          value: themeProvider.isDarkMode(),
                          onChanged: (value) {
                            themeProvider.changeThemeLanguage(
                              (value ? ThemeMode.dark : ThemeMode.light),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
