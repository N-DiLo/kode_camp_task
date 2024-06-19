import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final TextStyle? style;
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final bool? softwrap;
  final TextAlign? textAlign;

  const MyText({
    super.key,
    this.textAlign,
    this.style,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.softwrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      softWrap: softwrap,
      textScaler: MediaQuery.textScalerOf(context),
      text,
      style: GoogleFonts.montserrat(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
