import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseConnection {
  //crete user data
  Future<void> addUserData(String id, String firstName, String lastName,
      String email, String url) async {
    final user = <String, String>{
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "URL": url
    };
    var db = FirebaseFirestore.instance;
    try {
      db.collection("users").doc(id).set(user);
    } catch (e) {
      print(e);
    }
  }

//update user
  Future<void> updateUserData(String id, String firstName, String lastName,
      String email, String url) async {
    final user = <String, String>{
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "URL": url
    };
    var db = FirebaseFirestore.instance;
    try {
      await db.collection("users").doc(id).update(user);
    } catch (e) {
      print(e);
    }
  }

  //create event
  Future<void> addEvent(String id, String eventType, String eventName,
      String description, String url) async {
    final event = <String, String>{
      "createrId": id,
      "eventType": eventType,
      "eventName": eventName,
      "description": description,
      "URL": url
    };
    var db = FirebaseFirestore.instance;
    try {
      await db.collection("events").doc(id).update(event);
    } catch (e) {
      print(e);
    }
  }
}
