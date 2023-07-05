import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:speak/core/util/utils.dart';
import 'package:speak/views/cardScreen/cards_for_user_page.dart';

import 'all_cards.dart';

class Cards extends HookConsumerWidget {
  const Cards({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final controller = usePageController();

    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Row(
                  children: [
                    ActionChip(label: const Text('For you'),
                      onPressed: () => controller.animateToPage(0, duration: const Duration(milliseconds: 200), curve: Curves.easeIn),),
                    ActionChip(label: const Text('All'),
                      onPressed: () => controller.animateToPage(1, duration: const Duration(milliseconds: 200), curve: Curves.easeIn),
                    ),
                  ],
                ),
                  
                SizedBox(
                  height: MediaQuery.of(context).size.height - 128 - 16,
                    child: PageView(
                      controller: controller,
                      children: const [
                        CardsForUserPage(),
                        AllCardsPage(),
                        SizedBox(child: Center(child: Text('3'))),
                      ]
                    ),
                ),
              ],
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: secondaryPink,
          foregroundColor: text,
          elevation: 0,
          onPressed: (){},
          extendedIconLabelSpacing: 8,
          icon: const Icon(Icons.send_time_extension_outlined),
          label: const Text('make custom cards')
          ),
      );
  }
}
