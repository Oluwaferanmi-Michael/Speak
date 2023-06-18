import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/util/extensions/ext.dart';
import 'package:speak/core/util/utils.dart';
import 'package:speak/core/util/widgets.dart';
import '../../core/Util/illustrations.dart';
import '../../core/Util/strings.dart';
import '../../routes.dart';
import 'components/alt_button.dart';
import 'components/intro_sreen_constants.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: black,
        backgroundColor: Colors.transparent,
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 2.w,
          child: Image.asset(Illustrations.displayPicturePlaceholder.fullPath),
        ),
        actions: [
          Consumer(
            builder: (context, ref, child) => 
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () => context.push(Routes.settings)
            )
            ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 24.h
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Strings.welcome,
            style: GoogleFonts.poppins(
                fontSize: 24.h,
                fontWeight: FontWeight.w600
              ),),

            Gap(height: 42.h,),

            

            ListView.separated(
              itemCount: IntroScreenConstants.titles.length,
              itemBuilder: (context, index) {
                return AltButton(
                  icon: IntroScreenConstants.icons[index],
                  title: IntroScreenConstants.titles[index],
                  value: index,
                  subtitle: IntroScreenConstants.subtitles[index],
                );
              },
              
              separatorBuilder: (context, index) => Gap(height: 12.h,),),

            // const AltButton(
            //   icon: Icon(Icons.extension_outlined),
            //   title: Strings.cards,
            //   value: 0,
            //   subtitle: Strings.communicateWithCards,
            // ),

            

            // const AltButton(
            //   icon: Icon(Icons.chat_bubble_outline),
            //   title: Strings.chat,
            //   value: 1,
            //   subtitle: Strings.talkWithAChatFormat,
            // ),
            // Gap(height: 12.h,),
            // const AltButton(
            //   icon: Icon(Icons.change_history_outlined),
            //   title: Strings.draw,
            //   value: 2,
            //   subtitle: Strings.drawWhatYouMean,
            // ),
            // Gap(height: 12.h,),
            // const AltButton(
            //   icon: Icon(Icons.play_arrow_outlined),
            //   title: Strings.speechToText,
            //   subtitle: Strings.speechTranslatedToText,
            //   value: 3,
            // ),
            // Gap(height: 12.h,),
            // const AltButton(
            //   icon: Icon(Icons.volume_up_outlined),
            //   title: Strings.textToSpeech,
            //   value: 4,
            //   subtitle: Strings.speakByDevice,
            // ),
          ]
        )),
    );
  }
}