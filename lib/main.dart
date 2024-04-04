import 'package:flutter/material.dart';
import 'package:totalx_task/core/app_theme.dart';
import 'package:totalx_task/view/pages/phone_Authentication/phonenumber_enter_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme.theme(),
      home: const PhoneNumberEnterPage());
  }
}
