import 'package:flutter/material.dart';
import 'package:totalx_task/view/pages/otp/otp_entering_page.dart';
import 'package:totalx_task/view/pages/phone_Authentication/phonenumber_enter_page.dart';

final PageController pageController = PageController(initialPage: 0);

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        PhoneNumberEnterPage(),
        OtpEnteringPage(),
      ],
    );
  }
}
