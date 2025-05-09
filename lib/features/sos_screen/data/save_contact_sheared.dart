import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/trustedNumberModel.dart';

// Save list of contacts
Future<void> saveTrustedContacts(List<TrustedContactModel> contacts) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> jsonList =
  contacts.map((contact) => jsonEncode(contact.toJson())).toList();
  await prefs.setStringList('trusted_contacts', jsonList);
}

// Load list of contacts
Future<List<TrustedContactModel>> loadTrustedContacts() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? jsonList = prefs.getStringList('trusted_contacts');
  if (jsonList != null) {
    return jsonList
        .map((jsonItem) =>
        TrustedContactModel.fromJson(jsonDecode(jsonItem)))
        .toList();
  } else {
    return [];
  }
}
