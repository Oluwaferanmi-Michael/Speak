import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speak/core/util/extensions/ext.dart';
import 'package:speak/core/util/illustrations.dart';
import 'package:speak/core/util/widgets.dart';
import 'package:speak/views/dialog/models/dialog_model.dart';

import '../../../core/util/strings.dart';

class ForgotPasswordDialog extends AlertModel{
  ForgotPasswordDialog() : super(
    title: 'Link Sent!',
    message: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
        width: 140.w, child: Image.asset(Illustrations.linkSent.fullPath),),

        Gap(height: 32.h,),

        Text(
          Strings.passwordResetLinkSent,
          style: GoogleFonts.poppins(
                fontSize: 16,
          ),)
      ],
    ),
    buttons: {
      Strings.thankYou : true
    }
  );

}