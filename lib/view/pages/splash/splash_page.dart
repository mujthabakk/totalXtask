import 'package:flutter/material.dart';
import 'package:totalx_task/service/auth_service/authservice.dart';
import 'package:totalx_task/view/pages/auth/auth_page.dart';
import 'package:totalx_task/view/pages/homepage/homepage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthServices.getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          return snapshot.data == null ? const AuthPage() : const HomePage();
        });
  }
}
