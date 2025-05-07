
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woman_safety_ui/features/chatting/data/models/logged_user_list_model.dart';
import 'package:woman_safety_ui/features/common/widget/custom_divider.dart';

import '../../../../auth/screens/sign_in_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});
  static const String name='/user-list';
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
   final User? user=FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    //if user is null, navigate to sign in screen
    if (user == null) {
      Future.delayed(Duration.zero, () {
        Get.toNamed(SignInScreen.name);
      });
      return const Scaffold(
        body: Center(
          child: Text("Please log in to see user list."),
        ),
      );
    }

    //if user is not null, show user list
    return Scaffold(
appBar: AppBar(),
      body: StreamBuilder(
          stream: FirebaseDatabase.instance.ref('users').onValue,
          builder: (context,snapshot){
            //check if snapshot has waiting see progress
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            //check if snapshot has error see error message
            if(snapshot.hasError){
              debugPrint("error=============${snapshot.error.toString()}");
              return Center(child: Text(snapshot.error.toString()),);
            }
            //check if snapshot has data
            if(snapshot.hasData && snapshot.data!.snapshot.value!=null){
              // Get the snapshot data from Firebase and cast it as a Map.
             final data=snapshot.data!.snapshot.value as Map<dynamic,dynamic>;
             // Map the entries of the data (key-value pairs) to create a list of LoggedUserListModel objects.
             List<LoggedUserListModel> users=data.entries.map((entry){
               // Convert the entry value (which is dynamic) into a Map<String, dynamic>.
               final userMap = Map<String, dynamic>.from(entry.value);
               // Create a LoggedUserListModel from the userMap and return it.
               return LoggedUserListModel.fromJson(userMap);
             }).toList();

             return ListView.builder(
               itemCount: users.length,
               itemBuilder: (context,index){
                 return Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Column(
                     children: [
                       Card(
                         child: ListTile(
                           title: Text(users[index].name),
                           subtitle: Text(users[index].email!),
                           onTap: (){
                             debugPrint("success============");
                           },
                         ),
                       ),
                       const CustomDivider(),
                     ],
                   ),
                 );
               },
             );
            }
            else {
              return const Center(child: Text("No users found"));
            }
          },
      ),
    );
  }
}
