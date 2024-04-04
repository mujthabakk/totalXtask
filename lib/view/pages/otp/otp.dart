import 'dart:js';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/image/Group (3).png",
                ),
              ),
              SizedBox(
                height: context.height(80),
              ),
              const Text(
                "OTP Verification",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              SizedBox(
                height: context.height(28),
              ),
              const Text(
                "Enter the verification code we just sent to your number +91 *******21.",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: context.height(40),
              ),
              OtpTextField(
                borderRadius: BorderRadius.circular(16),
                cursorColor: Colors.red,
                textStyle: const TextStyle(color: Colors.red),
                numberOfFields: 6,
                focusedBorderColor: Colors.black,
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {},
              ),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(top: context.height(10)),
                child: const Text("data"),
              )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Get OTP?"),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Resend ",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              FrontendPagesButton(
                text: 'Verify',
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
