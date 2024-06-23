import 'package:flutter/material.dart';
import 'package:kode_camp_task/components/my_button.dart';
import 'package:kode_camp_task/task_3/bottom_nav.dart';
import 'package:kode_camp_task/task_3/views/home_page.dart';

import 'package:kode_camp_task/task_3/views/no_login.dart';
import 'package:kode_camp_task/task_3/views/onboard.dart';
import 'package:kode_camp_task/task_3/views/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
        useMaterial3: true,
      ),
      home: const OnBoard(),
      routes: {
        SignUp.routeName: (context) => const SignUp(),
        BottomNav.routeName: (context) => const BottomNav(),
        NoLogin.routeName: (context) => const NoLogin(),
        HomePage.routeName: (context) => const HomePage(),
      },
    );
  }
}
