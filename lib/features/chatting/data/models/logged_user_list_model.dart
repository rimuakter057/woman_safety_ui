class LoggedUserListModel {
  final String name;
  final String? email;
  final String ?uid;

  LoggedUserListModel({required this.name,  this.email,  this.uid});

factory LoggedUserListModel.fromJson(Map<String,dynamic>jsonData){
  return LoggedUserListModel(
      name: jsonData['name']??"no name",
      email: jsonData['email']??"no email",
      uid: jsonData['uid'],
  );
}
Map <String,dynamic>toJson(){
  return{
    'name':name,
    'email':email,
    'uid':uid,
  };
}

}

