import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kode_camp_task/components/app_text_styles.dart';

import 'package:kode_camp_task/components/my_button.dart';
import 'package:kode_camp_task/components/my_input_field.dart';
import 'package:kode_camp_task/components/my_text_widget.dart';
import 'package:kode_camp_task/task_3/bottom_nav.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const routeName = '/sign-up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pswController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pswController.dispose();
    super.dispose();
  }

  bool accepted = false;
  bool hidePass = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? checkEmail(String? email) {
    RegExp forEmail =
        RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})?$');
    final validEmail = forEmail.hasMatch(email ?? '');
    if (!validEmail) {
      return 'Please enter a valid mailing address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .06),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyText(
                  text: 'Create New Account',
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: height * .03),
                MyInputField(
                  labelText: 'Name',
                  keyType: TextInputType.name,
                  controller: nameController,
                  validator: (name) => name!.length <= 8
                      ? 'Please include first name & last name'
                      : null,
                ),
                SizedBox(height: height * .03),
                MyInputField(
                  labelText: 'Email',
                  keyType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: checkEmail,
                ),
                SizedBox(height: height * .03),
                MyInputField(
                  labelText: 'Password',
                  validator: (password) => password!.length < 8
                      ? 'Password must be eight characters or more'
                      : null,
                  keyType: TextInputType.visiblePassword,
                  isPassword: hidePass,
                  controller: pswController,
                  suffixIcon: Icon(
                    hidePass
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  iconPressed: () {
                    setState(() {
                      hidePass = !hidePass;
                    });
                  },
                ),
                SizedBox(height: height * .04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                          text: 'Accept ',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                                fontSize: 15,
                              ),
                            )
                          ]),
                    ),
                    Transform.scale(
                      scaleX: 0.65,
                      scaleY: 0.65,
                      child: Switch.adaptive(
                          activeColor: primaryColor,
                          trackOutlineColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          value: accepted,
                          onChanged: (value) {
                            setState(() {
                              accepted = !accepted;
                            });
                          }),
                    )
                  ],
                ),
                SizedBox(height: height * .03),
                MyButton(
                  title: 'Register',
                  onTap: () {
                    formKey.currentState!.validate();
                    if (emailController.text.isEmpty ||
                        nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          margin: EdgeInsets.all(10.0),
                          behavior: SnackBarBehavior.floating,
                          content: Center(
                            child: MyText(text: 'Complete required fields'),
                          ),
                        ),
                      );
                      return;
                    }
                    if (accepted == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          margin: EdgeInsets.all(10.0),
                          behavior: SnackBarBehavior.floating,
                          content: Center(
                            child: MyText(text: 'Accept Terms & Conditions'),
                          ),
                        ),
                      );
                      return;
                    }

                    Navigator.pushReplacementNamed(
                      arguments: NameArgs(nameController.text),
                      context,
                      BottomNav.routeName,
                    );
                  },
                ),
                SizedBox(height: height * .02),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: SizedBox(
                            width: width * .2,
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
                            width: width * .2,
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
                SizedBox(height: height * .03),
                Center(
                  child: Text.rich(
                    TextSpan(
                        text: 'Do you have an account? ',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            // recognizer: TapGestureRecognizer()
                            //   ..onTap =
                            //       () => Navigator.pushNamed(context, '/no-login'),
                            text: 'Just register',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
