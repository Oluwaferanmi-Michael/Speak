import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speak/views/ChatScreen/chat_widgets.dart';
import 'package:speak/core/Models/chat_message_model.dart';
import 'package:speak/core/Models/enums.dart';
import 'package:speak/core/Util/utils.dart';
import 'package:speak/core/Util/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/controllers/chat_provider.dart';

class Chat extends ConsumerWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController messageController = TextEditingController();
    final messages = ref.watch(chatProvider);
    final messageNotifier = ref.watch(chatProvider.notifier);

    return Scaffold(
        body: Padding(
            // color: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
            child: Stack(
                // mainAxisAlignment: MainAxisAlignment.end,
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
                  Align(
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
                              icon: Icons.send,
                              onTap: () => messageController.text.isEmpty
                                  ? null
                                  : messageNotifier.addMessage(ChatMessageModel(
                                      message: messageController.value.text,
                                      messageType: MessageType.sender,
                                      timeSent: DateTime.now().toLocal())))
                          // FloatingActionButton(
                          //     child: const Icon(Icons.send_sharp),
                          //     onPressed: () {
                          //       messageNotifier.addMessage(ChatMessageModel(
                          //           message: messageController.value.text,
                          //           messageType: MessageType.sender,
                          //           timeSent: DateTime.now().toLocal()));

                          //       messageController.clear();
                          //     })
                        ],
                      ),
                    ),
                  )
                ])
            // child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Expanded(
            //           child: messages.isEmpty
            //               ? const Center(
            //                   child: Text('Start typing to say something'),
            //                 )
            //               : Container(
            //                   alignment: Alignment.centerLeft,
            //                   width: MediaQuery.of(context).size.width,
            //                   child: ListView.builder(
            //                     reverse: true,
            //                     // shrinkWrap: true,
            //                     itemCount: messages.length,
            //                     itemBuilder: (context, index) => ChatBubble(
            //                       message: messages[index].message,
            //                       time: messages[index].timeSent.toString(),
            //                     ),
            //                   ),
            //                 )),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Flexible(
            //             child: ConstrainedBox(
            //               constraints: BoxConstraints(
            //                 maxHeight: 135.h,
            //                 minHeight: MediaQuery.of(context).size.width / 8.h,
            //                 maxWidth: MediaQuery.of(context).size.width,
            //                 minWidth: MediaQuery.of(context).size.width,
            //               ),
            //               child: Scrollbar(
            //                 child: TextField(
            //                   controller: messageController,
            //                   autocorrect: true,
            //                   keyboardType: TextInputType.multiline,
            //                   maxLines: null,
            //                   // minLines: null,
            //                   // expands: true,
            //                   cursorRadius: const Radius.circular(16),
            //                   cursorColor: primaryPink,
            //                   decoration: InputDecoration(
            //                       fillColor: const Color(0xFFF4F4F4),
            //                       filled: true,
            //                       border: OutlineInputBorder(
            //                           borderRadius: BorderRadius.circular(12),
            //                           borderSide: BorderSide.none),
            //                       hintText: 'type something'),
            //                 ),
            //               ),
            //             ),
            //           ),

            //           Button(
            //               type: ButtonType.icon,
            //               icon: Icons.send,
            //               onTap: () => messageController.text.isEmpty
            //                   ? null
            //                   : messageNotifier.addMessage(ChatMessageModel(
            //                       message: messageController.value.text,
            //                       messageType: MessageType.sender,
            //                       timeSent: DateTime.now().toLocal())))
            //           // FloatingActionButton(
            //           //     child: const Icon(Icons.send_sharp),
            //           //     onPressed: () {
            //           //       messageNotifier.addMessage(ChatMessageModel(
            //           //           message: messageController.value.text,
            //           //           messageType: MessageType.sender,
            //           //           timeSent: DateTime.now().toLocal()));

            //           //       messageController.clear();
            //           //     })
            //         ],
            //       ),
            //     ])
            ));
  }
}
