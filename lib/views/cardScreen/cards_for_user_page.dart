import 'package:flutter/material.dart%20';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/core/Util/widgets.dart';
import 'package:speak/core/controllers/providers/chat_provider.dart';
import 'package:speak/views/chatScreen/components/message_widget.dart';

class CardsForUserPage extends HookConsumerWidget {
  const CardsForUserPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageController = useTextEditingController();
    final messageNotifier = ref.watch(chatProvider.notifier);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: MessageWidget(messageController: messageController, messageNotifier: messageNotifier)),

          Gap(height: 24.h,),

          const Text('Greetings'),
          SizedBox(
            height: MediaQuery.of(context).size.width - 100,
            child: Wrap(
              children: List.generate(50, (index) => const ActionChip(label: Text('label'))),
            )
          ,)
        ],
      );
  }
}