import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kode_camp_task/components/my_button.dart';
import 'package:kode_camp_task/components/my_text_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const routeName = '/sign-up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyText(
                text: 'Create New Account',
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * .04),
              const MyText(
                text: 'Name',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * .06),
              MyButton(
                title: 'Register',
                onTap: () {},
              ),
              SizedBox(height: height * .02),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(
                          width: width * .3,
                          child: const Divider(
                            thickness: 2,
                            color: Color.fromARGB(255, 212, 210, 210),
                          ),
                        ),
                      ),
                      TextSpan(
                          text: ' or register using ',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          )),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SizedBox(
                          width: width * .3,
                          child: const Divider(
                            thickness: 2,
                            color: Color.fromARGB(255, 212, 210, 210),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * .02),
              MyButton(
                outline: true,
                leading: Image.asset(
                  'assets/images/google.png',
                  width: 20,
                  height: 20,
                ),
                title: 'Google',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
