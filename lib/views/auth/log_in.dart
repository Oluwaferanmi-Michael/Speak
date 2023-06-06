import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:speak/core/util/strings.dart';
import 'package:speak/views/Auth/auth_widgets.dart';
import 'package:speak/routes.dart';

import '../../core/Util/utils.dart';
import '../../core/Util/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 42.h),
      child: Column(
        children: [
          SizedBox(
              width: 139.w, child: Image.asset('assets/images/auth_il.png')),
          Gap(height: 57.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.login,
                  // style: GoogleFonts.poppins(
                  //     fontSize: 24, fontWeight: FontWeight.bold, color: text)
                  ),
              Gap(height: 21.h),
              const AuthTextField(
                label: Strings.emailOrUsername,
              ),
              Gap(height: 12.h),
              const AuthTextField(
                label: Strings.password,
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                      fillColor: MaterialStateProperty.all(grey),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      
                      value: false,
                      onChanged: (value) {}),
                  Expanded(
                    child: Text(
                      Strings.keepMeLoggedIn,
                      // style: GoogleFonts.poppins(
                      //   fontSize: 12.w,
                      //   color: black,
                      // ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      Strings.forgotPassword,
                      // style: GoogleFonts.poppins(
                      //     fontSize: 12.w,
                      //     color: black,
                      //     decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              Gap(height: 140.h),
              const Button(
                buttonLabel: Strings.login,
              ),
              Gap(height: 12.h),
              Text(
                Strings.dontHaveAnAccount,
                // style: GoogleFonts.poppins(
                //     fontSize: 12.w, color: black.withOpacity(.5)),
              ),
              Button(
                onTap: () => context.push(Routes.signUp),
                secondary: true,
                buttonLabel: Strings.signUp,
              )
            ],
          )
        ],
      ),
    ));
  }
}
