import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/controllers/bottom_nav_provider.dart';
import 'package:speak/core/util/utils.dart';

import '../../../routes.dart';

class AltButton extends ConsumerWidget {
  final Icon icon;
  final String title;
  final String? subtitle;
  final int value;
  final void Function()? onPressed;

  const AltButton({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
    this.subtitle,
    required this.value,
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: altPink,
        borderRadius: BorderRadius.circular(12.w)
        ),
      child: ListTile(
        dense: true,
        // contentPadding: const EdgeInsets.all(0),
        titleAlignment: ListTileTitleAlignment.center,
        leading: icon,
        title: Text(title),
        subtitle: Text(subtitle ?? ''),
        onTap: () {
          ref.read(bottomNavProvider.notifier).changeScreenValue(value);
          context.push(Routes.home);
          },
        iconColor: text,
        titleTextStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: text,
          fontSize:16.w,
        ),
        subtitleTextStyle: GoogleFonts.poppins(
          color: paragraph,
          fontSize:12.w,
        ),
      ),
    );
    
    
    // TextButton(
    //   onPressed: onPressed,
    //   child: Container(
    //     padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
    //     child: Row(),
    //     )
    // );
  }
}