import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speak/core/controllers/providers/is_loading_provider.dart';
import 'package:speak/core/text_to_speech/providers/text_to_speech_provider.dart';
import 'package:speak/core/models/chat_message_model.dart';
import 'package:speak/core/Util/utils.dart';
import 'package:speak/core/Util/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/controllers/providers/chat_provider.dart';
import '../../../core/models/enums.dart';


class MessageWidget extends ConsumerWidget {
  const MessageWidget({
    super.key,
    required this.messageController,
    required this.messageNotifier,
  });

  final TextEditingController messageController;
  final ChatNotifier messageNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.read(isLoadingProvider);

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 135.h,
                  minHeight:
                      MediaQuery.of(context).size.width / 8.h,
                  maxWidth:
                      MediaQuery.of(context).size.width - 300.w,
                  minWidth:
                      MediaQuery.of(context).size.width - 300.w,
                ),
                child: Scrollbar(
                  child: TextField(
                    controller: messageController,
                    autocorrect: true,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: null,
                    cursorRadius: const Radius.circular(16),
                    cursorColor: primaryPink,
                    decoration: InputDecoration(
                        fillColor: const Color(0xFFF4F4F4),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        hintText: 'type something'),
                  ),
                ),
              ),
            ),

            Gap(
              width: 12.w,
            ),

            Button(
              type: ButtonType.icon,
                icon: isLoading ? const CircularProgressIndicator.adaptive() : const Icon(Icons.send),
                onTap: () {
                  final toSpeechNotifier = ref.watch(textToSpeechProvider.notifier);

                  if (messageController.text.isEmpty == false) {
                    messageNotifier.addMessage(
                      ChatMessageModel(
                        message: messageController.value.text,
                        messageType: MessageType.sender,
                        timeSent: DateTime.now().toLocal()));

                    toSpeechNotifier.convertTextToSpeech(text: messageController.text);
                  }
              })
          ],
        ),
      ),
    );
  }
}
