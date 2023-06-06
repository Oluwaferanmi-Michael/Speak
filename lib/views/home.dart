import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:speak/views/stt_screen.dart';
import 'package:speak/views/tts_screen.dart';
import 'package:speak/core/controllers/bottom_nav_provider.dart';
import 'package:speak/core/Util/utils.dart';

import 'cards_screen.dart';
import 'chat_screen.dart';
import 'draw_screen.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = ref.watch(bottomNavProvider.notifier);
    final page = ref.watch(bottomNavProvider);

    return Scaffold(
      body: screens[page],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            nav.changeScreenValue(value);
          },
          backgroundColor: secondaryPink,
          currentIndex: page,
          elevation: 0,
          selectedItemColor: primaryPink,
          selectedFontSize: 12.w,
          // selectedLabelStyle: GoogleFonts.poppins(
          //   fontWeight: FontWeight.w600,
          // ),
          unselectedFontSize: 12.w,
          unselectedItemColor: paragraph,
          // unselectedLabelStyle: GoogleFonts.poppins(),
          type: BottomNavigationBarType.fixed,
          items: items),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: page == 0 || page == 4
          ? null
          : FloatingActionButton(
              elevation: 0,
              onPressed: () => nav.changeScreenValue(3),
              child: const Icon(Icons.mic),
            ),
    );
  }
}

const items = [
  BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: 'Chat'),
  BottomNavigationBarItem(icon: Icon(Icons.extension_outlined), label: 'Cards'),
  BottomNavigationBarItem(icon: Icon(Icons.mic_outlined), label: 'Text-to-Speech'),
  BottomNavigationBarItem(icon: Icon(Icons.change_history), label: 'Draw'),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.play_arrow_outlined,
        // color: Colors.white,
      ),
      label: 'Speech to Text'),
];

const screens = [
  Chat(),
  Cards(),
  TextToSpeech(),
  Draw(),
  STT(),
];