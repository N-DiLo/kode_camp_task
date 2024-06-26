import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:kode_camp_task/components/app_text_styles.dart';
import 'package:kode_camp_task/components/my_button.dart';
import 'package:kode_camp_task/components/my_text_widget.dart';
import 'package:kode_camp_task/task_3/widgets/add_task.dart';
import 'package:kode_camp_task/task_3/widgets/task_tile.dart';
import '../widgets/header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Passing provided name from the sign up screen

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
    if (controller.text.isNotEmpty && subController.text.isNotEmpty) {
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

  void editTask(int index) {
    if (controller.text.isNotEmpty && subController.text.isNotEmpty) {
      setState(() {
        avTasks[index][0] = controller.text;
        avTasks[index][1] = subController.text;
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

  int isComplete = 0;
  //Complete task
  void taskDone(bool? isSelected, int index) => setState(() {
        avTasks[index][2] = !avTasks[index][2];

        isSelected != true ? isComplete = 0 : isComplete++;
      });

  @override
  void dispose() {
    controller.dispose();
    subController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Adding current Date to app
    DateTime date = DateTime.now();
    String showDate = DateFormat('E, MMM dd').format(date);

    //Name of the user during registeraton
    final nameArgs = ModalRoute.of(context)!.settings.arguments as NameArgs;
    final userName = nameArgs.name;

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
        surfaceTintColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
        automaticallyImplyLeading: false,
        title: Text.rich(
          TextSpan(
            text: '$showDate\n',
            style: bodySmall,
            children: [
              TextSpan(
                  text:
                      'Hello, ${userName.substring(0, userName.indexOf(' '))}👋',
                  style: bodyLarge)
            ],
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * .02),
              HeaderWidget(
                taskNo: '${avTasks.length}',
                completedTask: '$isComplete',
              ),
              SizedBox(height: height * 0.03),
              const MyText(
                text: 'Tasks of the day',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              Flexible(
                child: SizedBox(
                  height: height * .7,
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
                      isEdited: (task) {
                        controller.text = avTasks[index][0];
                        subController.text = avTasks[index][1];
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => AddTask(
                            isEdit: true,
                            controller: controller,
                            subController: subController,
                            onTap: () {
                              editTask(index);
                            },
                          ),
                        );
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
