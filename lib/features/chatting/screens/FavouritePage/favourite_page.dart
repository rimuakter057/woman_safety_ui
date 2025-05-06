import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({super.key});
  var hour = DateTime.now().hour.toString();
  var minute = DateTime.now().minute.toString();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (
        context,
        index,
      ) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Image.asset(
              "assets/images/man.jpg",
              fit: BoxFit.fill,
              height: 30,
              width: 30,
            ),
          ),
          title: Text(
            "Aroshi Rusha",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text("I love you",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall),
          trailing: Text(
            "$hour:$minute ",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        );
      },
    );
  }
}
