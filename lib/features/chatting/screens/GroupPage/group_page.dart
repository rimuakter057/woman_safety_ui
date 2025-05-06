import 'package:flutter/material.dart';

import '../../../../app/utils/color/app_colors.dart';


class GroupPage extends StatelessWidget {
GroupPage({super.key});

  List <Map> groupList=[
    {
      "title":"Dinajpur Polytechnic Institute",
      "subtitle":"Assalamuyalaikum",
      "count" : 0,
      "time":"Yesterday",
      "image":"assets/images/man.jpg",
    },
    {
      "title":"Government Polytechnic Institute",
      "subtitle":"Online class ",
      "count" : 0,
      "time":"10/10/24",
      "image":"assets/images/man.jpg",
    },

    {
      "title":"Ostad Batch-8",
      "subtitle":"dear student,i hope you are well",
      "count" : 11,
      "time":"Yesterday",
      "image":"assets/images/man.jpg",
    },
    {
      "title":"Unofficial group flutter",
      "subtitle":"Assalamuyalaikum",
      "count" : 4,
      "time":"Yesterday",
      "image":"assets/images/man.jpg",
    },


  ];

  var hour =DateTime.now().hour.toString();
  var minute = DateTime.now().minute.toString();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groupList.length,
      shrinkWrap: true,
      itemBuilder: (context, index, ) {
        return ListTile(

          leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Image.asset(
              groupList[index]['image'],
              fit: BoxFit.fill,
              height: 30,
              width: 30,
            ),
          ),
          title: Text(groupList[index]['title'],
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,),
          subtitle:  Text(groupList[index]['subtitle'],
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("$hour:$minute ",style: Theme.of(context).textTheme.bodySmall,),
              // condition unsuccessful
              groupList[index]['count'] ==0 ?const SizedBox(): CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.green,
                child: Text(
                  groupList[index]['count'].toString(),
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
