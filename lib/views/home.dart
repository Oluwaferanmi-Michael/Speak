import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speak/core/draw/providers/draw_provider.dart';
import 'package:speak/views/stt_screen.dart';
import '../core/controllers/providers/bottom_nav_provider.dart';
import 'package:speak/core/util/utils.dart';

import '../core/util/strings.dart';
import 'cardScreen/cards_screen.dart';
import '../views/chatScreen/chat_screen.dart';
import 'drawScreen/draw_screen.dart';

class Home extends ConsumerWidget {
  const Home({
    Key? key,
    }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = ref.watch(bottomNavProvider.notifier);
    final page = ref.watch(bottomNavProvider);
    final drawNotifier = ref.watch(drawProvider.notifier);

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
          selectedLabelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
          unselectedFontSize: 12.w,
          unselectedItemColor: paragraph,
          unselectedLabelStyle: GoogleFonts.poppins(),
          type: BottomNavigationBarType.fixed,
          items: items),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: page != 2
          ? null
          : FloatingActionButton(
            backgroundColor: primaryPink,
              elevation: 0,
              onPressed: () => drawNotifier.clear(),
              child: const Icon(Icons.clear),
            ),
    );
  }
}

const items = [
  BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: Strings.chat),
  BottomNavigationBarItem(icon: Icon(Icons.extension_outlined), label: Strings.cards),
  BottomNavigationBarItem(icon: Icon(Icons.change_history), label: Strings.draw),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.play_arrow_outlined,
      ),
      label: Strings.speechToText),
];

const screens = [
  Chat(),
  Cards(),
  Draw(),
  STT(),
];
