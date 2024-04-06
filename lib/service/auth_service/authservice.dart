import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:totalx_task/core/exception/auth_exception.dart';

class AuthServices {
  static final auth = FirebaseAuth.instance;

  static Stream<User?> getUser() {
    return auth.authStateChanges();
  }

  static Future<void> verifyPhone(String phone,
      {required void Function(String verificationId, int? forceResendingToken)
          codeSent}) async {
    try {
      log('verify');
      await auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (error) {},
        codeSent: codeSent,
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(error: e.message);
    }
  }

  static Future<void> signInWithCredntial(
      {required String verificationId, required String smsCode}) async {
    try {
      final PhoneAuthCredential phoneAuthCredential =
          PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(phoneAuthCredential);
    } on FirebaseAuthException catch (e) {
      throw AuthException(error: e.message);
    }
  }
}
