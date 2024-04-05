import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_task/controller/auth_controller/auth_controllerr.dart';
import 'package:totalx_task/core/size/size.dart';
import 'package:totalx_task/view/pages/auth/auth_page.dart';
import 'package:totalx_task/view/widget/Button/button.dart';

class PhoneNumberEnterPage extends StatelessWidget {
  const PhoneNumberEnterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phone = TextEditingController();
    final provider = Provider.of<AuthController>(context);
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
              height: context.height(28),
            ),
            TextFormField(
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Enter Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(17)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 41, 39, 39)),
                ),
              ),
            ),
            SizedBox(
              height: context.height(20),
            ),
            TextButton(
              onPressed: () {},
              child: RichText(
                text: const TextSpan(
                  text: "By Continuing, I agree to TotalX’s",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: " Terms and condition & privacy policy ",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: context.height(40),
            ),
            Consumer<AuthController>(
              builder: (context, value, child) {
                if (value.isLoading == true) {
                  return const CircularProgressIndicator();
                }
                return FrontendPagesButton(
                  text: 'Get OTP',
                  ontap: () {
                    if (phone.text.isNotEmpty) {
                      provider.createUser(context, phone: "+91${phone.text}");
                      pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
