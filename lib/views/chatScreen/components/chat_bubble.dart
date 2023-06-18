import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speak/core/Util/utils.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  const ChatBubble({required this.message, required this.time, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints.tight(Size(width: MediaQuery.of(context).size.width / 2.w, height: 56.h)),
      // alignment: Alignment.centerRight,
      // width: MediaQuery.of(context).size.width / 2.w,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8, left: 12),
      decoration: BoxDecoration(
          color: secondaryPink,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.w),
              topRight: Radius.circular(12.w),
              bottomLeft: Radius.circular(12.w),
              bottomRight: Radius.zero)),
      child: Align(
        alignment: Alignment.topRight,
        child: Text(message,
            style: GoogleFonts.poppins(
              fontSize: 12,
            )
            ),
      ),
      // height: 24,
      // width: MediaQuery.of(context).size.width / 2,
    );
  }
}
// Text(time,
//               style: GoogleFonts.poppins(
//                 fontSize: 8,
//               )),