import 'package:flutter/material.dart';

import '../../../../app/utils/color/app_colors.dart';


class UnreadChatPage extends StatelessWidget {
   UnreadChatPage({super.key});
List <Map> unreadList=[
  {
    "title":"Rozina",
    "subtitle":"How are you",
    "count" : 4,
    "image":"assets/images/man.jpg",
  },
  {
    "title":"Rusha",
    "subtitle":"I love you" ,
    "count" : 3,
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
    "count" : 3,
    "image":"assets/images/man.jpg",
  },
  {
    "title":"Riyad",
    "subtitle":"you are my cousin",
    "count" : 10,
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
      itemCount: unreadList.length,
      shrinkWrap: true,
      itemBuilder: (context, index, ) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Image.asset(
              unreadList[index]['image'],
              fit: BoxFit.fill,
              height: 30,
              width: 30,
            ),
          ),
          title: Text(unreadList[index]['title'],
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,),
          subtitle:  Text(unreadList[index]['subtitle'],
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("$hour:$minute ",style: Theme.of(context).textTheme.bodySmall,),
              // condition unsuccessful
              unreadList[index]['count'] ==0 ?const SizedBox(): CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.green,
                child: Text(
                  unreadList[index]['count'].toString(),
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
