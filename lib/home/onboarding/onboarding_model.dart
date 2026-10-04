import 'package:athaar_app/utils/app_image.dart';

class OnBoardingModel {
  String imagePath;

  String title;

  String decription;

  OnBoardingModel({
    this.imagePath = AppImage.onBoarding1,
    this.decription = 'decription',
    this.title = 'title',
  });
}
