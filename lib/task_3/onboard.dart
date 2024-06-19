import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kode_camp_task/task_3/sign_up.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});
  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/startup.png'),
            ),
            SizedBox(height: height * .06),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                  text: 'Thought of creating\n',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                  children: [
                    TextSpan(
                      text: 'something for your',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                    TextSpan(
                      text: ' Tasks',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: const Color(0xffF160AE),
                      ),
                    ),
                    TextSpan(
                      text: '?',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                  ]),
            ),
            Text(
              textAlign: TextAlign.center,
              'Find an administrative tool powered by KodeCamp to solve all you To-Dos.',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(height: height * .08),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(double.infinity, height * .06),
                ),
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor: const MaterialStatePropertyAll(
                  Color(0xffF160AE),
                ),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, SignUp.routeName);
              },
              child: Text(
                'Continue',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: height * .04),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                  text: 'Do you have an account? ',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => Navigator.pushNamed(context, '/no-login'),
                      text: 'Login',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
