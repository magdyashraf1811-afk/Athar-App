import 'package:athaar_app/home/widget/custom_elevated_button.dart';
import 'package:athaar_app/home/widget/custom_text_form_field.dart';
import 'package:athaar_app/l10n/app_localizations.dart';
import 'package:athaar_app/utils/app_colors.dart';
import 'package:athaar_app/utils/app_image.dart';
import 'package:athaar_app/utils/app_routes.dart';
import 'package:athaar_app/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: AppColors.transparentColor,
        title: Image.asset(AppImage.logo),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.04,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: height * 0.02,
            children: [
              Text(
                AppLocalizations.of(context)!.create_account,
                style: themeProvider.isDarkMode()
                    ? AppStyle.bold20White
                    : AppStyle.bold20Gold,
              ),
              Text(
                AppLocalizations.of(context)!.join_athar,
                style: themeProvider.isDarkMode()
                    ? AppStyle.bold16lightGray
                    : AppStyle.bold16Black,
              ),
              CustomTextFormField(
                filled: true,
                fillColor: themeProvider.isDarkMode()
                    ? AppColors.surFaceColor
                    : AppColors.whiteColor,
                borderSideColor: themeProvider.isDarkMode()
                    ? AppColors.goldAccentColor
                    : AppColors.beigeColor,
                hintText: AppLocalizations.of(context)!.full_name,
                hintStyle: AppStyle.bold16lightGray,
                prefixIcon: Icon(
                  Icons.person_2_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              CustomTextFormField(
                filled: true,
                fillColor: themeProvider.isDarkMode()
                    ? AppColors.surFaceColor
                    : AppColors.whiteColor,
                borderSideColor: themeProvider.isDarkMode()
                    ? AppColors.goldAccentColor
                    : AppColors.beigeColor,
                hintText: AppLocalizations.of(context)!.email_address,
                hintStyle: AppStyle.bold16lightGray,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              CustomTextFormField(
                filled: true,
                fillColor: themeProvider.isDarkMode()
                    ? AppColors.surFaceColor
                    : AppColors.whiteColor,
                borderSideColor: themeProvider.isDarkMode()
                    ? AppColors.goldAccentColor
                    : AppColors.beigeColor,
                hintText: AppLocalizations.of(context)!.password,
                hintStyle: AppStyle.bold16lightGray,
                prefixIcon: Icon(
                  Icons.lock_outline_rounded,
                  color: AppColors.primaryColor,
                ),
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              CustomTextFormField(
                filled: true,
                fillColor: themeProvider.isDarkMode()
                    ? AppColors.surFaceColor
                    : AppColors.whiteColor,
                borderSideColor: themeProvider.isDarkMode()
                    ? AppColors.goldAccentColor
                    : AppColors.beigeColor,
                hintText: AppLocalizations.of(context)!.conform_password,
                hintStyle: AppStyle.bold16lightGray,
                prefixIcon: Icon(
                  Icons.lock_outline_rounded,
                  color: AppColors.primaryColor,
                ),
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: AppColors.primaryColor,
                ),
              ),

              CustomElevatedButton(
                backgroundColor: AppColors.primaryColor,
                onPressed: () {
                  login(context);
                },
                child: Text(
                  AppLocalizations.of(context)!.sign_in,
                  style: AppStyle.bold18sunFace,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: themeProvider.isDarkMode()
                          ? AppColors.goldAccentColor
                          : AppColors.lightGrayColor,
                      thickness: 1,
                      indent: width * 0.06,
                      endIndent: width * 0.03,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: themeProvider.isDarkMode()
                        ? AppStyle.bold16bgWhite
                        : AppStyle.bold16lightGray,
                  ),
                  Expanded(
                    child: Divider(
                      color: themeProvider.isDarkMode()
                          ? AppColors.goldAccentColor
                          : AppColors.lightGrayColor,
                      thickness: 1,
                      indent: width * 0.06,
                      endIndent: width * 0.03,
                    ),
                  ),
                ],
              ),
              CustomElevatedButton(
                borderSideColor: themeProvider.isDarkMode()
                    ? AppColors.goldAccentColor
                    : AppColors.beigeColor,
                backgroundColor: themeProvider.isDarkMode()
                    ? AppColors.transparentColor
                    : AppColors.whiteColor,
                onPressed: () {
                  // todo login with google
                },
                child: Row(
                  spacing: width * 0.02,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImage.googleLogo),
                    Text(
                      AppLocalizations.of(context)!.continue_with_google,
                      style: themeProvider.isDarkMode()
                          ? AppStyle.bold16bgWhite
                          : AppStyle.bold16lightGray,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.already_have_an_account,
                    style: themeProvider.isDarkMode()
                        ? AppStyle.bold14lightGray
                        : AppStyle.bold16Black2,
                  ),
                  TextButton(
                    onPressed: () {
                      //todo navigator go to login screen
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.loginScreen,
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: AppStyle.bold14Primary,
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

  void login(BuildContext context) {
    //todo login
    Navigator.of(context).pushReplacementNamed(AppRoutes.homeRouteScreen);
  }
}
