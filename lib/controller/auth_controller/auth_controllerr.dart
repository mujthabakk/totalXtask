import 'package:flutter/material.dart';
import 'package:totalx_task/core/exception/base_exception.dart';
import 'package:totalx_task/core/utils/error_snack_bar.dart';
import 'package:totalx_task/service/auth_service/authservice.dart';

class AuthController extends ChangeNotifier {
  late final String? vId;
  bool _loading = false;
  bool get isLoading => _loading;

  Future<void> createUser(
    BuildContext context, {
    required String phone,
  }) async {
    _loading = true;
    try {
      AuthServices.verifyPhone(
        phone,
        codeSent: (verificationId, forceResendingToken) {
          vId = verificationId;
        },
      );
    } on BaseException catch (e) {
      Future.sync(
        () => showErrorSnackBar(error: e.message, context: context),
      );
    } finally {
      _loading = false;
    }
    notifyListeners();
  }

  Future<void> signInWithOtp(BuildContext context,
      {required String smsCode}) async {
    _loading = false;
    try {
      await AuthServices.signInWithCredntial(
        verificationId: vId!,
        smsCode: smsCode,
      );
    } on BaseException catch (e) {
      Future.sync(
        () => showErrorSnackBar(error: e.message, context: context),
      );
    } finally {
      _loading = false;
    }
    notifyListeners();
  }
}
