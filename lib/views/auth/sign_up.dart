import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:speak/core/util/strings.dart';
import 'package:speak/core/util/utils.dart';
import 'package:speak/views/auth/components/auth_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/Util/widgets.dart';
import '../../core/auth/providers/auth_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../routes.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulHookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
            SizedBox(
                width: 139.w, child: Image.asset('assets/images/auth_il.png')),
            Gap(height: 57.h),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    
                  Text(Strings.signIn,
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.bold, color: text)
                      ),
                      
                  Gap(height: 21.h),

                  Button(
                    onTap: () async => await ref.read(authStateProvider.notifier).signInWithGoogle(),
                    buttonLabel: Strings.signInWithGoogle,
                    secondary: true,
                  ),

                  Gap(height: 21.h),
                    
                  AuthTextField(
                    validator: (email) => email != null && !EmailValidator.validate(email) ? Strings.pleaseCheckYourEmail : null,
                    controller: emailController,
                    label: Strings.email,
                    hintText: Strings.emailHint,
                  ),
                    
                  const Gap(
                    height: 12,
                  ),
                    
                  AuthTextField(
                    validator: (password) => password != null && password.length < 6 ? Strings.passwordMustbeMoreThan : null,
                    obscure: true,
                    controller: passwordController,
                    label: Strings.password,
                    hintText: Strings.passwordHint,
                  ),
                    
                    
                  const Gap(
                    height: 114,
                  ),
                    
                  Button(
                    buttonLabel: Strings.signUp,
                    onTap: () async {
                      // perform signUp and navigate to home on success
    
                      final form = formKey.currentState!;
      
                      if (form.validate()){
                        await ref.watch(authStateProvider.notifier).createUser(
                        email: emailController.text, password: passwordController.text);
                      }
      
                    }
                  ),
                    
                  Gap(
                    height: 16.h,
                  ),
                    
                  Text(
                    Strings.alreadyHaveAnAccount,
                    style: GoogleFonts.poppins(
                        fontSize: 12, color: Colors.black.withOpacity(.5)),
                  ),
                    
                  Button(
                    onTap: () => context.push(Routes.logIn),
                    secondary: true,
                    buttonLabel: Strings.login,
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
