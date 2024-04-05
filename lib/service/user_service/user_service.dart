import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totalx_task/core/exception/user_exception.dart';

class FireStoreservice {
static  final db = FirebaseFirestore.instance;

 static  Future<DocumentReference<Map<String, dynamic>>> create(
      String name, String age, String phone,
      
       String image
       ) {
    final data = {"name": name, "age": age, "phone": phone,
     "image": image
     };

    try {
      return db.collection("contact").add(data);
    } on FirebaseException catch (e) {
      throw UserExceptio(message: e.toString());
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> collectionread() {
    try {
      return db.collection("contact").orderBy("name").snapshots();
    } on FirebaseException catch (e) {
      throw UserExceptio(message: e.toString());
    }
  }

  Future<void> delete(String id) {
    try {
      return db.collection("contact").doc(id).delete();
    } on FirebaseException catch (e) {
      throw UserExceptio(message: e.toString());
    }
  }
}
