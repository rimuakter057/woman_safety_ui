import 'package:flutter/material.dart';

import '../../../../../app/utils/color/app_colors.dart';


class MessageDetails extends StatefulWidget {
  final String name;
  final String profile;
  const MessageDetails({super.key, required this.name, required this.profile});

  @override
  State<MessageDetails> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessageDetails> {

  List<Map> messageList = [
    {
      "message": "Assalamuyalaikum..",
      "is_me": true,
      "time": "10:00 am",
    },
    {
      "message": "What is your name",
      "is_me": false,
      "time": "10:00 am",
    },
    {
      "message": "my name is rimu",
      "is_me": true,
      "time": "10:00 am",
    },
    {
      "message": "do i know you",
      "is_me": false,
      "time": "10:00 am",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.secondaryPrimaryColor,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            )),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Image.asset(
              widget.profile,
              fit: BoxFit.fill,
              height: 20,
              width: 20,
            ),
          ),
          title: Text(
            widget.name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            "last seen today at 12:04 pm",
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.video_call_outlined,
                color: AppColors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call_outlined,
                color: AppColors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.white,
              )),
        ],
      ),
      body: Padding(
        padding:  const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: messageList.length,
                  itemBuilder: (context, index) {
                    return  Column(
                        crossAxisAlignment:messageList [index] ['is_me'] == true?
                     CrossAxisAlignment.end:
                     CrossAxisAlignment.start,
                      children: [
                        Container(
                            constraints: BoxConstraints(
                              maxWidth: size.width *0.7,
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                color:messageList [index] ['is_me'] == true? Colors.green:
                                Colors.grey,
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
            Row(children: [
              Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      prefixIcon: Icon(Icons.emoji_emotions_outlined),
                      suffixIcon: Icon(Icons.link)
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5,),
              CircleAvatar(backgroundColor: AppColors.white,
              child: IconButton(onPressed: (){}, icon: Icon(Icons.send,color: AppColors.primaryColor,)),
              )
            ],)
          ],
        ),
      ),


       );
  }
}
