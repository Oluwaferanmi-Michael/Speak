
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speak/core/util/widgets.dart';

class AlertModel {

  final String title;
  final Widget message;
  final Map<String, bool> buttons;

  const AlertModel({
    required this.message,
    required this.title,
    required this.buttons
  });

}

extension ShowDialog on AlertModel{
    void present(BuildContext context ) => showDialog(
      context: context, builder: (_) {
        return AlertDialog(
          content: message,
          actions: buttons.entries.map((e) => Button(
            buttonLabel: e.key,
            onTap: () => Navigator.of(context).pop(e.value),
          )).toList(),
          contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        );
      });
  }