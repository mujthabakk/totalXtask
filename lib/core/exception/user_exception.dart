import 'package:totalx_task/core/exception/base_exception.dart';

class UserExceptio extends BaseException {
  final String? errorMessage;
  UserExceptio({required this.errorMessage})
      : super(
          message: errorMessage ?? "An Unknown exception occured",
        );
}
