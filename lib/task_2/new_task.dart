import 'package:flutter/material.dart';
import 'package:kode_camp_task/task_2/items.dart';
import 'package:kode_camp_task/task_2/model/app_model.dart';

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Jordan Stock',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xff191144),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: ConstrainedBox(
          constraints: BoxConstraints(minWidth: width, minHeight: height),
          child: ListView.builder(
            itemCount: AppModel.products.length,
            itemBuilder: (context, index) =>
                Items(appModel: AppModel.products[index]),
          ),
        ));
  }
}
