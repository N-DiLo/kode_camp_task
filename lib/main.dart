import 'package:flutter/material.dart';
import 'package:kode_camp_task/new_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff3F3767),
        ),
        useMaterial3: true,
      ),
      home: const AppView(),
      // home: const MyHomePage(title: 'Flutter Home Page'),
    );
  }
}
