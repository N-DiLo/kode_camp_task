import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kode_camp_task/components/my_button.dart';

import 'package:kode_camp_task/components/my_text_widget.dart';

class MyInputField extends StatelessWidget {
  final TextInputType? keyType;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool isPassword;
  final String labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final void Function()? iconPressed;

  const MyInputField({
    super.key,
    this.keyType,
    this.controller,
    this.textStyle,
    this.validator,
    this.onChanged,
    this.isPassword = false,
    required this.labelText,
    this.hintText,
    this.suffixIcon,
    this.iconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: labelText,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyType,
          obscureText: isPassword,
          validator: validator,
          onChanged: onChanged,
          style: GoogleFonts.montserrat(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: hintText,
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: iconPressed,
                    child: suffixIcon,
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 212, 210, 210)),
                borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.circular(10)),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: Color.fromARGB(255, 212, 210, 210)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
