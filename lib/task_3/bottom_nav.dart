import 'package:flutter/material.dart';
import 'package:kode_camp_task/components/menu_screen.dart';
import 'package:kode_camp_task/components/my_button.dart';
import 'package:kode_camp_task/task_3/home_page.dart';
import 'package:kode_camp_task/task_3/task_menu.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});
  static const routeName = '/bottom-nav';

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final appScreens = [
    const HomePage(),
    const TaskMenu(),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          backgroundColor: whiteColor,
          unselectedFontSize: 12,
          selectedFontSize: 14,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Task Done',
              icon: Icon(Icons.task_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Menu',
              icon: Icon(Icons.menu_outlined),
            ),
          ]),
    );
  }
}
