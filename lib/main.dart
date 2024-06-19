import 'package:flutter/material.dart';

import 'package:kode_camp_task/task_3/no_login.dart';
import 'package:kode_camp_task/task_3/onboard.dart';
import 'package:kode_camp_task/task_3/sign_up.dart';

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
          seedColor: const Color(0xffF160AE),
        ),
        useMaterial3: true,
      ),
      home: const OnBoard(),
      routes: {
        SignUp.routeName: (context) => const SignUp(),
        NoLogin.routeName: (context) => const NoLogin(),
      },
    );
  }
}
