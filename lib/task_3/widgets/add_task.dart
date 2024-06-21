import 'package:flutter/material.dart';
import 'package:kode_camp_task/components/my_button.dart';
import 'package:kode_camp_task/components/my_input_field.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    super.key,
    required this.onTap,
    required this.controller,
    required this.subController,
  });

  final void Function()? onTap;
  final TextEditingController controller;
  final TextEditingController subController;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return AlertDialog(
      contentPadding: const EdgeInsets.all(15.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
      ),

      content: SizedBox(
        height: height * .45,
        width: width,
        child: Column(
          children: [
            SizedBox(height: height * .02),
            MyInputField(
              controller: controller,
              hintText: 'Add a new task',
              labelText: 'Task Title',
              keyType: TextInputType.text,
            ),
            SizedBox(height: height * .02),
            MyInputField(
              controller: subController,
              hintText: 'Add a new task subtitle',
              labelText: 'Task Subtitle',
              keyType: TextInputType.text,
            ),
            SizedBox(height: height * .05),
            MyButton(
              title: 'Add Task',
              onTap: onTap,
            ),
            SizedBox(height: height * .03),
            MyButton.outline(
              title: 'Cancel',
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
