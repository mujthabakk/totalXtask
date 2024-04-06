import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totalx_task/core/exception/user_exception.dart';

class FireStoreservice {
  static final db = FirebaseFirestore.instance;

  static Future<DocumentReference<Map<String, dynamic>>> create(
      String name, String age, String phone, String image) {
    final data = <String, String>{
      'name': name,
      'age': age,
      'phone': phone,
      'image': image,
    };

    try {
      return db.collection('contact').add(data);
    } on FirebaseException catch (e) {
      throw UserExceptio(errorMessage: e.message);
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserStream() {
    try {
      return db.collection('contact').orderBy("name").snapshots();
    } on FirebaseException catch (e) {
      throw UserExceptio(errorMessage: e.message);
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>>
      sortUserAgeGrtrSixtyStream() {
    try {
      return db
          .collection('contact')
          .where('age', isGreaterThanOrEqualTo: '60')
          .snapshots();
    } on FirebaseException catch (e) {
      throw UserExceptio(errorMessage: e.message);
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>>
      sortUserAgelsthanSixtyStream() {
    try {
      return db
          .collection('contact')
          .where('age', isLessThan: '60')
          .snapshots();
    } on FirebaseException catch (e) {
      throw UserExceptio(errorMessage: e.message);
    }
  }

  Future<void> delete(String id) {
    try {
      return db.collection('contact').doc(id).delete();
    } on FirebaseException catch (e) {
      throw UserExceptio(errorMessage: e.message);
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> searchStream(
    String searchText,
  ) {
    try {
      return db
          .collection('contact')
          .where(
            'name',
            isEqualTo: searchText,
          )
          .snapshots();
    } on FirebaseException catch (e) {
      throw UserExceptio(errorMessage: e.message);
    }
  }
}
