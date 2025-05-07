
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
   final User? user=FirebaseAuth.instance.currentUser;
   FirebaseDatabase database = FirebaseDatabase.instance;
  void signInUser(){
    if(user!=null){
    //  database.ref()
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
