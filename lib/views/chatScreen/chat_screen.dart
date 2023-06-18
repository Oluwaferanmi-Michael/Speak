import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/controllers/providers/chat_provider.dart';
import '../chatScreen/components/messge_widget.dart';
import 'components/chat_bubble.dart';

class Chat extends ConsumerWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageController = TextEditingController();
    final messages = ref.watch(chatProvider);
    final messageNotifier = ref.watch(chatProvider.notifier);
    

    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
            child: Stack(
                children: [
                  ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) =>
                      ChatBubble(
                        message: messages[index].message,
                        time: messages[index].timeSent.toString(),
                      ),
                      ),
                  MessageWidget(
                    messageController: messageController,
                    messageNotifier: messageNotifier
                    )
                ])

            ));
  }
}
