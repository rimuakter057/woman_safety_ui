import 'package:flutter/material.dart';
import '../../../../app/utils/color/app_colors.dart';
import '../AllChatList/chat_list_page.dart';
import '../FavouritePage/favourite_page.dart';
import '../GroupPage/group_page.dart';
import '../UnreadChatList/unread_chat_page.dart';





class HomePage extends StatefulWidget {
  const HomePage({super.key});
 static const String name = '/home-page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "WhatsApp",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )),
          ],
          bottom: TabBar(
            labelColor: AppColors.green,
            unselectedLabelColor: AppColors.white,
            indicatorColor: AppColors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 5,
            tabs: [
              Tab(
          child: Container(
            height: size.height * .05,
            width: size.width * .25,
            decoration: BoxDecoration(
              color: AppColors.whiteShade,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(child: Text("All",)),
          ),
              ),
              Tab(
                child: Container(
                  height: size.height * .05,
            width: size.width * .25,
                  decoration: BoxDecoration(
                    color: AppColors.whiteShade,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Text("Unread",)),
                ),
              ),
              Tab(
                child: Container(
                  height: size.height * .05,
                  width: size.width * .25,
                  decoration: BoxDecoration(
                    color: AppColors.whiteShade,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Text("Favourites",
                  maxLines: 1,
                  )),
                ),
              ),
              Tab(
                child: Container(
                  height: size.height * .05,
                  width: size.width * .25,
                  decoration: BoxDecoration(
                    color: AppColors.whiteShade,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Text("Groups",)),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.green,
          onPressed: () {},
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
        body: TabBarView(children: [
          ChatListPage(),
          UnreadChatPage (),
          FavouritePage(),
          GroupPage(),
        ]),
      ),
    );
  }
}


