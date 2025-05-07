import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../../app/utils/color/app_colors.dart';
import '../../../data/models/message_model.dart';

class MessageDetails extends StatefulWidget {
  final String receiverId;
  final String receiverName;

  const MessageDetails({super.key, required this.receiverId, required this.receiverName});

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

  late String chatRoomId;

  @override
  void initState() {
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser!;
    chatRoomId = getChatRoomId(currentUser.uid, widget.receiverId);
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
              child: StreamBuilder<DatabaseEvent>(
                stream: FirebaseDatabase.instance.ref('AllChat').child(chatRoomId).onValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }

                  if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
                    final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                    final messages = data.entries.map((entry) {
                      return MessageModel.fromJson(Map<String, dynamic>.from(entry.value));
                    }).toList();

                    return ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final currentUser = FirebaseAuth.instance.currentUser!;
                        return Column(
                          crossAxisAlignment: messages[index].senderId == currentUser.uid
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: size.width * 0.7,
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: messages[index].senderId == currentUser.uid
                                    ? Colors.white
                                    : Colors.grey,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(messages[index].message),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }

                  return const Center(child: Text('No messages yet'));
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
                const SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: IconButton(
                    onPressed: () {
                      final user = FirebaseAuth.instance.currentUser!;
                      var time = DateTime.now().toString();
                      var sendMessage = MessageModel(
                        message: sendMessageController.text,
                        senderId: user.uid,
                        senderName: user.displayName.toString(),
                        receiverId: widget.receiverId,
                        receiverName: widget.receiverName,
                        time: time,
                        type: 'text',
                      );
                      FirebaseDatabase.instance.ref('AllChat')
                          .child(chatRoomId)
                          .push()
                          .set(sendMessage.toJson());
                      sendMessageController.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
