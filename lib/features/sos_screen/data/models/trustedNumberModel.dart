
class TrustedContactModel {
  String name;
  String number;

  TrustedContactModel({required this.name, required this.number});
  factory TrustedContactModel.fromJson(Map<String, dynamic> json) {
    return TrustedContactModel(
      name: json['name'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,
    };
  }
}