/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:woman_safety_ui/core/utils/toast_message.dart';

import '../../../../app/utils/color/app_colors.dart';
import '../../data/list/all_chat_list.dart';
import 'MessagePageDetails/message_details.dart';


class ChatListPage extends StatefulWidget {

  ChatListPage({
    super.key,
  });

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  var hour =DateTime.now().hour.toString();

  var minute = DateTime.now().minute.toString();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allChatList.length,
      shrinkWrap: true,
      itemBuilder: (context, index, ) {
        return ListTile(
          onTap: (){
            final user= FirebaseAuth.instance.currentUser;
              if(user!=null){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageDetails(
                  receiverId:user.uid,
                  receiverName: user.displayName.toString(),
                )));

              }else{
                Utils().toastMessage("user not signIn");
              }
          },
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Image.asset(
              allChatList[index]['image'],
              fit: BoxFit.fill,
              height: 30,
              width: 30,
            ),
          ),
          title: Text(allChatList[index]['title'],
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,),
          subtitle:  Text(allChatList[index]['subtitle'],
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("$hour:$minute ",style: Theme.of(context).textTheme.bodySmall,),
             // condition unsuccessful
              allChatList[index]['count'] ==0 ?const SizedBox(): CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.green,
                child: Text(
                  allChatList[index]['count'].toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


*/
