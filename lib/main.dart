import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instragram_clone/responsive/mobileScreenLayout.dart';
import 'package:instragram_clone/responsive/responsiveLayout.dart';
import 'package:instragram_clone/responsive/webScreenLayout.dart';
import 'package:instragram_clone/screen/login_screen.dart';
import 'package:instragram_clone/screen/sign_up_screen.dart';
import 'package:instragram_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        // home: const Responsivelayout(
        //   webScreenLayout: Webscreenlayout(),
        //   mobileScreenLayout: Mobilescreenlayout(),
        // )
        home: const SignUpScreen(),
        );
  }
}
