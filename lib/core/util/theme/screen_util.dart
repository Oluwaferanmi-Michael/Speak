import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ScreenUtil extends StatelessWidget {
  final Widget builder;
  final Widget? initialPage;
  final Widget? child;
  const ScreenUtil({
    this.child,
    required this.builder, this.initialPage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return builder;
      },
    );
  }
}
