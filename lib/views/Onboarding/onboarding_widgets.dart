import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speak/core/Util/widgets.dart';

import '../../core/Models/enums.dart';

class OnboardingText extends StatelessWidget {
  final String title;
  final String sub;
  const OnboardingText({required this.title, required this.sub, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(title,),
              // style: GoogleFonts.poppins(
              //     fontSize: 24, fontWeight: FontWeight.bold)),
          Text(
            sub,),
              // style: GoogleFonts.poppins(
              //   fontSize: 16,
        ]));
  }
}

class OnboardingButtons extends StatelessWidget {
  final void Function()? leftOnTap;
  final void Function()? rightOnTap;
  const OnboardingButtons({this.leftOnTap, this.rightOnTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Button(
            secondary: true,
            type: ButtonType.medium,
            onTap: leftOnTap,
            buttonLabel: 'skip'),
        Button(
          onTap: rightOnTap,
          secondary: false,
          type: ButtonType.medium,
          icon: Icons.arrow_forward,
        )
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  final String image;
  final String title;
  final String body;
  const Page1(
      {required this.image, required this.body, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Image.asset(image),
            width: 321.w,
          ),
          OnboardingText(title: title, sub: body)
        ]);
  }
}
