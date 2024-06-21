import 'package:flutter/material.dart';
import 'package:kode_camp_task/components/my_button.dart';
import 'package:kode_camp_task/components/my_text_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.taskNo,
    required this.completedTask,
  });

  final String taskNo;
  final String completedTask;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: height * .15, minWidth: width * .42),
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  offset: Offset(1.5, 1.5),
                  color: Color.fromARGB(255, 238, 237, 237),
                )
              ], color: whiteColor, borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    child: MyText(text: '📦'),
                  ),
                  SizedBox(height: height * 0.03),
                  const MyText(
                    text: 'Total Tasks',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  MyText(
                    text: taskNo,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: height * .15, minWidth: width * .42),
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    child: MyText(text: '🙌'),
                  ),
                  SizedBox(height: height * 0.03),
                  const MyText(
                    text: 'Completed Tasks',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  MyText(
                    text: completedTask,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
