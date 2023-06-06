import 'package:flutter/material.dart';
import 'package:speak/core/Util/illustrations.dart';
import 'package:speak/core/Util/strings.dart';
import 'onboarding_widgets.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController pageController = PageController();
  bool isLastpage = false;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      isLastpage = index == 2;
                    });
                  },
                  children: const [
                    Page1(
                      image: Illustrations.onbIllustration1,
                      title: Strings.onboardingHeader1 ,
                      body: Strings.onboardingBody1,
                    ),
                    Page1(
                      image: Illustrations.onbIllustration2,
                      title: Strings.onboardingHeader1,
                      body: Strings.onboardingHeader1,
                    ),
                    Page1(
                      image: Illustrations.onbIllustration1,
                      title: Strings.onboardingHeader1,
                      body: Strings.onboardingHeader1,
                    ),
                  ],
                ),
              ),
              OnboardingButtons(
                leftOnTap: () => pageController.jumpToPage(3),
                rightOnTap: () async => await pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear),
              )
            ],
          )),
    );
  }
}
