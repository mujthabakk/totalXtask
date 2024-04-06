import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_task/controller/auth_controller/auth_controllerr.dart';
import 'package:totalx_task/controller/image_picker/image_picker_controller.dart';
import 'package:totalx_task/controller/user_provider/user_controller.dart';
import 'package:totalx_task/core/app_theme.dart';
import 'package:totalx_task/firebase_options.dart';
import 'package:totalx_task/view/pages/splash/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  // FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider<UserCollectionController>(
          create: (context) => UserCollectionController(),
        ),
        ChangeNotifierProvider<ImagePickerController>(
          create: (context) => ImagePickerController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(),
        home: const SplashPage(),
      ),
    );
  }
}
