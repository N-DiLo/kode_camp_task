import 'package:flutter/material.dart';

import 'package:kode_camp_task/components/app_text_styles.dart';
import 'package:kode_camp_task/components/my_button.dart';
import 'package:kode_camp_task/components/my_text_widget.dart';
import 'package:kode_camp_task/task_3/widgets/add_task.dart';
import 'package:kode_camp_task/task_3/widgets/task_tile.dart';
import 'widgets/header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Predifined List
  List avTasks = [
    ['E-Learning App', 'Design Onboarding Page', false],
    ['Car Rental Website', 'Coding for Landing Page', false],
    ['E-Learning App', 'Add Animations to Onboarding Page', false],
    ['Car Rental', 'Add Icons', false]
  ];

  final controller = TextEditingController();
  final subController = TextEditingController();

  //Create a new task
  void createTask() {
    if (controller.text.isNotEmpty || subController.text.isNotEmpty) {
      setState(() {
        avTasks.add([controller.text, subController.text, false]);
        controller.clear();
        subController.clear();
      });
    } else if (controller.text.isEmpty || subController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          content: Center(
            child: MyText(
              text: 'No value provided for Task title or subtitle',
            ),
          ),
        ),
      );
    }
    Navigator.pop(context);
  }

  //Complete task
  void taskDone(bool? isSelected, int index) => setState(() {
        avTasks[index][2] = !avTasks[index][2];
      });

  @override
  void dispose() {
    controller.dispose();
    subController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: primaryColor,
          child: const Center(
            child: Icon(
              Icons.add_outlined,
              color: whiteColor,
            ),
          ),
          onPressed: () => showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => AddTask(
                  controller: controller,
                  subController: subController,
                  onTap: createTask,
                ),
              )),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
        automaticallyImplyLeading: false,
        title: Text.rich(
          TextSpan(
            text: 'Jun 17\n',
            style: bodySmall,
            children: [TextSpan(text: 'Hello, 👋', style: bodyLarge)],
          ),
        ),
        actions: [
          const Icon(Icons.search_outlined),
          SizedBox(width: width * .02),
          const Icon(Icons.notifications_outlined),
          SizedBox(width: width * .02),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * .02),
              HeaderWidget(
                taskNo: '${avTasks.length}',
                completedTask: '2',
              ),
              SizedBox(height: height * 0.03),
              const MyText(
                text: 'Tasks of the day',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: height * .7,
                child: Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: avTasks.length,
                    itemBuilder: (context, index) => TaskTile(
                      isDone: avTasks[index][2],
                      taskTitle: avTasks[index][0],
                      taskSubtitle: avTasks[index][1],
                      onChanged: (isSelected) {
                        taskDone(isSelected, index);
                      },
                      isDeleted: (task) {
                        setState(() {
                          avTasks.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
