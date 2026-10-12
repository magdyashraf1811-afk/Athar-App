import 'package:athaar_app/utils/app_image.dart';

class OnBoardingModel {
  String lightImagePath;
  String darkImagePath;
  String title;
  String subTitle;
  String decription;

  OnBoardingModel({
    this.lightImagePath = AppImage.onBoarding1,
    this.decription = 'decription',
    this.title = 'title',
    this.subTitle = ' subtitle',
    this.darkImagePath = AppImage.onBoardingDark1,
  });
}
