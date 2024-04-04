import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:totalx_task/core/size/size.dart';
import 'package:totalx_task/view/widget/Button/button.dart';

class Otptextfield extends StatelessWidget {
  const Otptextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your verification code",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 27,
                    color: const Color.fromARGB(255, 213, 219, 208),
                  ),
            ),
            SizedBox(
              height: context.height(25),
            ),
            OtpTextField(
              numberOfFields: 6,
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              },
            ),
            SizedBox(
              height: context.height(65),
            ),
            FrontendPagesButton(
              text: 'Continue',
              ontap: () {},
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Haven’t received the code ?"),
                TextButton(onPressed: () {}, child: const Text("Resend code"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
