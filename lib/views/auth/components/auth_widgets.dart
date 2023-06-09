import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speak/core/util/utils.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? label;
  final bool? obscure;
  const AuthTextField({
    this.obscure,
    required this.controller,
    this.validator,
    this.hintText, this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label ?? '',
            style: GoogleFonts.poppins(
                fontSize: 12.w, fontWeight: FontWeight.bold, color: text)
            ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscure ?? false,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    width: 1,
                    color: red,
                  )
            ),
              contentPadding:
                  const EdgeInsets.only(left: 29, top: 16, bottom: 16),
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    width: 1,
                    color: black,
                  )),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 12, color: Colors.black.withOpacity(.5)
              )
            ),
        ),
      ],
    );
  }
}
