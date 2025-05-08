

class EmergencyContactModel {
  final String name;
  final String number;

  EmergencyContactModel({required this.name, required this.number});

  factory EmergencyContactModel.fromJson(Map<String,dynamic>jsonData){
    return EmergencyContactModel(
        name: jsonData['name'],
        number: jsonData['number']
    );
  }
}
