import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:speak/core/auth/providers/auth_provider.dart';
import 'package:speak/core/util/strings.dart';
import 'package:speak/views/auth/components/auth_widgets.dart';
import 'package:speak/routes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../core/Util/utils.dart';
import '../../core/Util/widgets.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
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
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.bold, color: text)
                    ),
                Gap(height: 21.h),
        
                AuthTextField(
                  validator: (email) => email != null && !EmailValidator.validate(email) ? Strings.pleaseCheckYourEmail : null ,
                  controller: emailController,
                  label: Strings.emailOrUsername,
                ),
        
                Gap(height: 12.h),
        
                AuthTextField(
                  validator: (password) => password != null && password.length < 6 ? Strings.passwordMustbeMoreThan : null ,
                  obscure: true,
                  controller: passwordController,
                  label: Strings.password,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
        
                  Gap(height: 8.h),
                    // Checkbox(
                    //     fillColor: MaterialStateProperty.all(grey),
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(5)),
                        
                    //     value: false,
                    //     onChanged: (value) {}),
                    // Expanded(
                    //   child: Text(
                    //     Strings.keepMeLoggedIn,
                    //     style: GoogleFonts.poppins(
                    //       fontSize: 12.w,
                    //       color: black,
                    //     ),
                    //   ),
                    // ),
        
                    GestureDetector(
                      onTap: () => context.push(Routes.forgotPassword),
                      child: Text(
                        Strings.forgotPassword,
                        style: GoogleFonts.poppins(
                            fontSize: 12.w,
                            color: black,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                
                Gap(height: 140.h),
        
                Button(
                  buttonLabel: Strings.login,
                  onTap: () async {
                    await ref.watch(authStateProvider.notifier).signIn(
                      email: emailController.text,
                      password: passwordController.text
                      ).then((value){
                        
                      });
                  }
                ),
        
                Gap(height: 12.h),
        
                Text(
                  Strings.dontHaveAnAccount,
                  style: GoogleFonts.poppins(
                      fontSize: 12.w, color: black.withOpacity(.5)),
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
            ),
        ));
  }
}
