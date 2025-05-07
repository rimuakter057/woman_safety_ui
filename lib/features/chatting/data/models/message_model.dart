class MessageModel {
  final String message;
  final String senderId;
  final String senderName;
  final String receiverId;
  final String receiverName;
  final String time;
  final String type;

  MessageModel(
      {required this.message,
      required this.senderId,
      required this.senderName,
      required this.receiverId,
      required this.receiverName,
      required this.time,
      required this.type});
  factory MessageModel.fromJson(Map<String,dynamic>jsonData){
    return MessageModel(
        message: jsonData['message'],
        senderId: jsonData['senderId'],
        senderName:  jsonData['senderName'],
        receiverId:  jsonData['receiverId'],
        receiverName:  jsonData['receiverName'],
        time:  jsonData['time'],
        type:  jsonData['type'],
    );
  }

  Map<String,dynamic> toJson(){
    return{
      'message':message,
      'senderId':senderId,
      'senderName':senderName,
      'receiverId':receiverId,
      'receiverName':receiverName,
      'time':time,
      'type':type
    };
  }
}
