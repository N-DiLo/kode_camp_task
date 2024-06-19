import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kode_camp_task/components/my_button.dart';
import 'package:kode_camp_task/components/my_text_widget.dart';
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
            const MyText(
              textAlign: TextAlign.center,
              softwrap: true,
              text:
                  'Find an administrative tool powered by KodeCamp to solve all you To-Dos.',
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 14,
            ),
            SizedBox(height: height * .08),
            MyButton(
              title: 'Continue',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, SignUp.routeName),
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
