import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/Util/utils.dart';

class AuthTextField extends StatelessWidget {
  final String? hintText;
  final String? label;
  const AuthTextField({this.hintText, this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label!,
            // style: GoogleFonts.poppins(
            //     fontSize: 12.w, fontWeight: FontWeight.bold, color: text)
            ),
        TextField(
          decoration: InputDecoration(
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
              // hintStyle: GoogleFonts.poppins(
              //     fontSize: 12, color: Colors.black.withOpacity(.5)
              // )
            ),
        ),
      ],
    );
  }
}
