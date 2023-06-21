

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/utils.dart';


class FloatingButtonWidget extends StatelessWidget {
  final Widget? icon;
  final Color? backgroundColor;
  final void Function()? onPressed;
  final bool Function(dynamic value)? onChanged;
  const FloatingButtonWidget({
    super.key,
    this.icon,
    this.backgroundColor,
    this.onPressed,
    this.onChanged
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 42.h,
        width: 42.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryPink
          ),
          borderRadius: BorderRadius.circular(8.w),
          color: backgroundColor,
        ),
        child: icon
      ),
    );
  }
}