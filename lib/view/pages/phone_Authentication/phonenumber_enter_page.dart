import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:totalx_task/core/size/size.dart';
import 'package:totalx_task/view/pages/otp/otp.dart';
import 'package:totalx_task/view/widget/Button/button.dart';

class PhoneNumberEnterPage extends StatelessWidget {
  const PhoneNumberEnterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/image/OBJECTS.png",
                width: context.width(130),
                height: context.width(102),
              ),
            ),
            SizedBox(
              height: context.height(120),
            ),
            Text(
              "Enter Phone Number",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 3, 3, 3),
                  ),
            ),
            SizedBox(
              height: context.height(20),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Phone Number",
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: RichText(
                text: const TextSpan(
                  text: "By Continuing, I agree to TotalX’s",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: " Terms and condition & privacy policy ",
                        style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: context.height(20),
            ),
            FrontendPagesButton(
              text: 'Get OTP',
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Otptextfield(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
