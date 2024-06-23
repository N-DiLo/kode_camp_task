import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kode_camp_task/components/my_button.dart';

class TaskCalendar extends StatelessWidget {
  const TaskCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(taskCal),
          const SizedBox(height: 20),
          Text(
            'Coming Soon!',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
