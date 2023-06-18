import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:speak/core/models/enums.dart';
import 'package:speak/core/Util/utils.dart';
import 'package:speak/core/util/strings.dart';

// Brand button
class Button extends StatelessWidget {
  final ButtonType type;
  final String? buttonLabel;
  final Widget? icon;
  final bool? secondary;
  final void Function()? onTap;

  /// Every type  of button represented by the brand, long, medium and icon
  const Button(
      {
      this.secondary = false,
      this.icon,
      this.buttonLabel,
      this.type = ButtonType.long,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == ButtonType.icon) {
      return InkWell(
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              height: MediaQuery.of(context).size.width / 8.w,
              width: MediaQuery.of(context).size.width / 8.w,
              decoration: BoxDecoration(
                color: primaryPink,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(child: icon)));
    } else if (type == ButtonType.medium) {
      return InkWell(
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              height: MediaQuery.of(context).size.width / 8.w,
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                  border: (secondary == true) ? Border.all(color: text) : null,
                  borderRadius: BorderRadius.circular(16),
                  color: (secondary == true) ? transparent : primaryPink),
              child: Center(
                  child: (buttonLabel == null)
                      ? icon
                      : Text(buttonLabel!))));
    } else {
      return InkWell(
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              height: MediaQuery.of(context).size.width / 8.w,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: (secondary == true) ? Border.all(color: text) : null,
                  borderRadius: BorderRadius.circular(16.w),
                  color: (secondary == true) ? transparent : primaryPink),
              child: Center(
                  child: Text(buttonLabel ?? Strings.labelHere,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.w,
                          color: text
                          )
                        )
                      )
                    )
                  );
    }
  }
}

class Gap extends StatelessWidget {
  final double? height;
  final double? width;

  /// helper widget for whitespace
  const Gap({this.height, this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
