import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireStorageService {
  static final storageRef =
      FirebaseStorage.instance.ref().child('user-profile');

  static Future<Reference> uploadProfile(File image) async {
    try {
      return  storageRef.putFile(image).snapshot.ref;
    } on FirebaseException catch (e) {
      throw e.message ?? "unkeown exception occured";
    }
  }
}
