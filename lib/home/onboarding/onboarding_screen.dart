import 'package:athaar_app/home/home_screen.dart';
import 'package:athaar_app/home/onboarding/dot_indicator.dart';
import 'package:athaar_app/home/onboarding/onboarding_model.dart';
import 'package:athaar_app/utils/app_colors.dart';
import 'package:athaar_app/utils/app_image.dart';
import 'package:athaar_app/utils/app_style.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  int currentIndex = 0;

  List<OnBoardingModel> onboardingList = [
    OnBoardingModel(
      imagePath: AppImage.onBoarding1,
      title: 'Welcome To Athar',
      decription:
          'Discover the stories, treasures, and places that bring our heritage to life.',
    ),
    OnBoardingModel(
      imagePath: AppImage.onBoarding2,
      title: 'Discover Our Heritage',
      decription:
          ' Explore the history, culture, and stories behind the places that shaped our world.',
    ),
    OnBoardingModel(
      imagePath: AppImage.onBoarding3,
      title: 'Explore Every Artifact',
      decription:
          'Discover fascinating artifacts and uncover the stories behind every piece.',
    ),
    OnBoardingModel(
      imagePath: AppImage.onBoarding4,
      title: 'Experience History Differently',
      decription:
          'Scan, explore, and interact with history through 3D, AR, and AI-powered experiences.',
    ),
    OnBoardingModel(
      imagePath: AppImage.onBoarding5,
      title: 'Your Journey Starts Here ',
      decription:
          'Discover new places, save your favorites, and make every visit a memorable experience.',
    ),
  ];

  @override
  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      final index = _pageController.page!.round();

      if (currentIndex != index) {
        setState(() {
          currentIndex = index;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        onboardingList[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.03,
                                right: size.height * 0.01,
                              ),

                              child: Text(
                                onboardingList[index].title,
                                style: AppStyle.bold36primary,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.03,
                                right: size.height * 0.01,
                                top: size.height * 0.03,
                                bottom: size.height * 0.03,
                              ),
                              child: Text(
                                onboardingList[index].decription,
                                style: AppStyle.light20primary,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsGeometry.only(
                                bottom: size.height * 0.02,
                              ),

                              child: Stack(
                                alignment: Alignment.center,

                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen(),
                                            ),
                                          );
                                        },

                                        child: Text(
                                          'skip',
                                          style: AppStyle.semibold20primary,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (currentIndex == 4) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(),
                                              ),
                                            );
                                          } else {
                                            _pageController.nextPage(
                                              duration: const Duration(
                                                milliseconds: 300,
                                              ),
                                              curve: Curves.easeInOut,
                                            );
                                          }
                                        },
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColors.primaryColor,
                                          size: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      DotIndicator(active: currentIndex == 0),
                                      DotIndicator(active: currentIndex == 1),
                                      DotIndicator(active: currentIndex == 2),
                                      DotIndicator(active: currentIndex == 3),
                                      DotIndicator(active: currentIndex == 4),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                itemCount: onboardingList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
