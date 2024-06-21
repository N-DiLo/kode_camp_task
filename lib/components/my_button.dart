import 'package:flutter/material.dart';
import 'package:kode_camp_task/components/my_text_widget.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color? color;
  final void Function()? onTap;
  final Widget? leading;
  final Widget? trailing;
  final bool outline;

  const MyButton({
    super.key,
    required this.title,
    this.color,
    this.onTap,
    this.leading,
    this.trailing,
    this.outline = false,
  });

  const MyButton.outline({
    super.key,
    required this.title,
    this.color,
    this.onTap,
    this.leading,
    this.trailing,
  }) : outline = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 50,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: outline ? 1.0 : 0.0,
            color: outline
                ? const Color.fromARGB(255, 212, 210, 210)
                : primaryColor,
          ),
          color: outline ? Colors.white : primaryColor,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leading != null) leading!,
              if (leading != null) const SizedBox(width: 10),
              MyText(
                text: title,
                fontSize: 20,
                color: outline ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600,
              ),
              if (trailing != null) const SizedBox(width: 10),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}

//Konstant color values
const primaryColor = Color(0xff6C63FF);
const optionalColor = Color(0xffF160AE);
const whiteColor = Colors.white;
const textColor = Colors.black;

//Konstant values for Images used in app
const startled = 'assets/images/startled.png';
const startup = 'assets/images/startup.png';
