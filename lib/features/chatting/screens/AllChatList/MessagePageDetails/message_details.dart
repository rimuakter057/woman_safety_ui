import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../../app/utils/color/app_colors.dart';
import '../../../data/list/message_list.dart';
import '../../../data/models/message_model.dart';
import '../../../widget/leading_widget.dart';
import '../../../widget/title_widget.dart';

class MessageDetails extends StatefulWidget {

  final String receiverId;
  final String receiverName;
  const MessageDetails(
      {super.key,

      required this.receiverId,
      required this.receiverName});
  static const String name = '/message-details';
  @override
  State<MessageDetails> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessageDetails> {
  final TextEditingController sendMessageController = TextEditingController();

  String getChatRoomId(String uid1, String uid2) {
    List<String> uids = [uid1, uid2];
    uids.sort();
    return '${uids[0]}_${uids[1]}';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.secondaryPrimaryColor,
      appBar: AppBar(
        title: Text(widget.receiverName),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: messageList[index]['is_me'] == true
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                          constraints: BoxConstraints(
                            maxWidth: size.width * 0.7,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: messageList[index]['is_me'] == true
                                  ? Colors.green
                                  : Colors.grey,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(messageList[index]['message']),
                          )),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.white,
                    ),
                    child: TextField(
                      controller: sendMessageController,
                      decoration: const InputDecoration(
                          hintText: "Type a message",
                          prefixIcon: Icon(Icons.emoji_emotions_outlined),
                          suffixIcon: Icon(Icons.link)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: IconButton(
                      onPressed: () {
                        final user = FirebaseAuth.instance.currentUser;
                        var time = DateTime.now().toString();
                        var sendMessage = MessageModel(
                            message: sendMessageController.text,
                            senderId: user!.uid,
                            senderName: user.displayName.toString(),
                            receiverId: widget.receiverId,
                            receiverName: widget.receiverName,
                            time: time,
                            type: 'text');
                        final chatRoomId = getChatRoomId(user.uid, widget.receiverId);
                        FirebaseDatabase.instance.ref('AllChat')
                            .child(chatRoomId)
                            .push()
                            .set(sendMessage.toJson());
                        sendMessageController.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: AppColors.primaryColor,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
