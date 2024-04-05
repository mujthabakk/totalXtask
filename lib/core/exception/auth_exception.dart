import 'package:totalx_task/core/exception/base_exception.dart';

class AuthException extends BaseException {
  String? error;
  AuthException({
    required this.error,
    String? message,
  }) : super(message: error ?? 'Authentication failed,Please try again');
}
