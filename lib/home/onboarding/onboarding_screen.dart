import 'package:athaar_app/home/home_screen.dart';
import 'package:athaar_app/home/onboarding/dot_indicator.dart';
import 'package:athaar_app/home/onboarding/onboarding_model.dart';
import 'package:athaar_app/utils/app_image.dart';
import 'package:athaar_app/utils/app_style.dart';
import 'package:flutter/material.dart';

import 'slide_to_start_buttom.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  int currentIndex = 0;

  final List<OnBoardingModel> onboardingList = [
    OnBoardingModel(
      lightImagePath: AppImage.onBoarding1,
      darkImagePath: AppImage.onBoardingDark1,
      title: 'Discover Egypt’s',
      subTitle: 'Heritage',
      decription:
          'Explore museums, artifacts, and stories that bring Egypt’s hisyory to life.',
    ),
    OnBoardingModel(
      lightImagePath: AppImage.onBoarding2,
      darkImagePath: AppImage.onBoardingDark2,
      title: 'Meet Your',
      subTitle: 'Smart Guide',
      decription:
          'Discover artifacts, learn their stories, and experience museums in a smart way.',
    ),
    OnBoardingModel(
      lightImagePath: AppImage.onBoarding3,
      darkImagePath: AppImage.onBoardingDark3,
      title: 'History Meets',
      subTitle: 'Technology',
      decription: 'Eplore, ask questions, and experience Egypt with ATHER.',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      if (!_pageController.hasClients || _pageController.page == null) {
        return;
      }

      final index = _pageController.page!.round();

      if (currentIndex != index && mounted) {
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

  void goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final size = MediaQuery.of(context).size;

    final bool isLastPage = currentIndex == onboardingList.length - 1;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: onboardingList.length,
          itemBuilder: (context, index) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  isDark
                      ? onboardingList[index].darkImagePath
                      : onboardingList[index].lightImagePath,
                  fit: BoxFit.cover,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        onboardingList[index].title,
                        textAlign: TextAlign.left,
                        style: isDark
                            ? AppStyle.bold34White
                            : AppStyle.bold34Black,
                      ),
                      SizedBox(height: 0.5),
                      Text(
                        onboardingList[index].subTitle,
                        textAlign: TextAlign.left,
                        style: AppStyle.bold34Gold,
                      ),
                      SizedBox(height: 2),

                      Text(
                        onboardingList[index].decription,
                        style: isDark
                            ? AppStyle.bold18White
                            : AppStyle.bold18Black,
                      ),

                      SizedBox(height: size.height * 0.04),

                      if (isLastPage) ...[
                        SizedBox(
                          width: double.infinity,
                          child: SlideToStartButton(onSlideComplete: goToHome),
                        ),
                      ] else ...[
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: goToHome,
                                  child: Text(
                                    'Skip',
                                    style: isDark
                                        ? AppStyle.bold16White
                                        : AppStyle.bold16Black,
                                  ),
                                ),

                                GestureDetector(
                                  onTap: () {
                                    _pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      AppImage.nextIcon,
                                      width: 30,
                                      height: 30,
                                    ),
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
                              ],
                            ),
                          ],
                        ),
                      ],

                      SizedBox(height: size.height * 0.025),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
