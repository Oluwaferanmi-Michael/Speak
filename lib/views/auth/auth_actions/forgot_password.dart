import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/auth/providers/auth_actions_provider.dart';
import 'package:speak/core/util/strings.dart';
import 'package:speak/core/util/widgets.dart';
import 'package:speak/views/auth/components/auth_widgets.dart';
import 'package:speak/views/dialog/models/dialog_model.dart';
import '../../../core/util/utils.dart';
import '../../dialog/models/forgot_password_dialog.dart';

class ForgotPasswordScreen extends HookConsumerWidget {
  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final emailController = useTextEditingController();

    return Scaffold(
      
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Gap(
              height: 300.h,
            ),
            
            Text(Strings.enterYourEmail,
              style: GoogleFonts.poppins(
                color: paragraph,
                fontWeight: FontWeight.w400
              )
              ),
      
            Form(
              key: formKey,
              child: AuthTextField(
                validator: (email) => email != null && !EmailValidator.validate(email.trim()) ? Strings.pleaseCheckYourEmail : null,
                hintText: Strings.emailHint,
                controller: emailController,
              ),
            ),

            const Spacer(flex: 1),

            Button(
              buttonLabel: Strings.sendLink,
              onTap: () async {
                final form = formKey.currentState!;
                final email = emailController.text;
                if (form.validate()) {
                  final notifier = ref.watch(authActionsProvider.notifier);
                    await notifier.sendPasswordResetLink(
                    email: email.trim())
                    .then(
                      (value) {
                        if(value == true){
                          ForgotPasswordDialog().present(context);
                      } }
                    );
                  }
                }
            )
            
          ],
        ),
      ),
    );
  }
}