import 'package:flutter/material.dart';

import '../../../../app/utils/color/app_colors.dart';
import 'MessagePageDetails/message_details.dart';


class ChatListPage extends StatelessWidget {

  ChatListPage({
    super.key,
  });


  List<Map> allChatList = [
    {
      "title": "Rimu",
     "subtitle": "what are you doing",
      "count" : 0,
      "image":"assets/images/man.jpg",
    },
    {
      "title":"Rozina",
      "subtitle":"How are you",
    "count" : 4,
      "image":"assets/images/man.jpg",
    },
   {
"title":"ariful",
"subtitle":"I need some money" ,
     "count" : 0,
     "image":"assets/images/man.jpg",
        },
{
"title":"Rusha",
"subtitle":"I love you" ,
  "count" : 3,
  "image":"assets/images/man.jpg",
},
{
"title":"Riya",
"subtitle":"i am a student",
  "count" : 0,
  "image":"assets/images/man.jpg",
},
{
"title":"Aroshi",
"subtitle":"here i am" ,
  "count" : 5,
  "image":"assets/images/man.jpg",
},
{
"title": "Lakib",
"subtitle":"you are my friend",
  "count" : 0,
  "image":"assets/images/man.jpg",
},
{
"title":"Riyad",
"subtitle":"you are my cousin",
  "count" : 0,
  "image":"assets/images/man.jpg",
},
{
"title": "Ripon",
"subtitle":"here i am",
  "count" : 7,
  "image":"assets/images/man.jpg",
},

  ];

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
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageDetails(
              name: allChatList[index]['title'],
              profile: allChatList[index]['image'],)));
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


