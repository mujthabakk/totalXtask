import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totalx_task/core/exception/user_exception.dart';

class UserController extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<DocumentReference<Map<String, dynamic>>> create(
    String name,
    String age,
    String phone,
    String image,
  ) async {
    final data = {
      "name": name,
      "age": age,
      "phone": phone,
      "image": image,
    };

    try {
      final result = await db.collection("contact").add(data);
      notifyListeners();
      return result;
    } on FirebaseException catch (e) {
      throw UserExceptio(message: e.toString());
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readUser() {
    notifyListeners();
    return db.collection("contact").snapshots();
  }
}
