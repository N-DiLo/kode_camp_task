import 'package:flutter/material.dart';
import 'package:kode_camp_task/components/my_button.dart';
import 'package:kode_camp_task/components/my_text_widget.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.isDone,
    required this.taskTitle,
    required this.taskSubtitle,
    required this.onChanged,
  });

  final bool isDone;
  final String taskTitle;
  final String taskSubtitle;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        leading: Checkbox(
          value: isDone,
          onChanged: onChanged,
        ),
        tileColor: whiteColor,
        title: MyText(
          text: taskTitle,
          fontSize: 13,
          color: Colors.black38,
          fontWeight: FontWeight.w500,
        ),
        subtitle: MyText(
          text: taskSubtitle,
          fontSize: 15,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
