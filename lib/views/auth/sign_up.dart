import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:speak/core/util/strings.dart';
import 'package:speak/views/Auth/auth_widgets.dart';

import '../../core/Util/widgets.dart';
import '../../routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
        child: Column(children: [
          SizedBox(
              width: 139.w, child: Image.asset('assets/images/auth_il.png')),
          Gap(height: 57.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Strings.signIn,
                  // style: GoogleFonts.poppins(
                  //     fontSize: 24, fontWeight: FontWeight.bold, color: text)
                  ),
              Gap(height: 21.h),
              const AuthTextField(
                label: Strings.email,
                hintText: Strings.emailHint,
              ),
              const Gap(
                height: 12,
              ),
              const AuthTextField(
                label: Strings.password,
                hintText: Strings.passwordHint,
              ),
              const Gap(
                height: 12,
              ),
              const AuthTextField(
                label: Strings.phoneNumber,
                hintText: Strings.phoneNumberHint,
              ),
              Gap(
                height: 102.h,
              ),

              const Button(
                buttonLabel: Strings.signUp,
              ),

              Gap(
                height: 16.h,
              ),
              Text(
                Strings.alreadyHaveAnAccount,
                // style: GoogleFonts.poppins(
                //     fontSize: 12, color: Colors.black.withOpacity(.5)),
              ),
              Button(
                onTap: () => context.push(Routes.logIn),
                secondary: true,
                buttonLabel: Strings.login,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
