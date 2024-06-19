import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kode_camp_task/components/my_button.dart';
import 'package:kode_camp_task/task_3/sign_up.dart';

class NoLogin extends StatelessWidget {
  const NoLogin({super.key});
  static const routeName = '/no-login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(startled),
            const SizedBox(height: 20),
            Text(
              'Oops... No Login found!',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, SignUp.routeName);
              },
              child: Text(
                'Click to Sign Up',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
