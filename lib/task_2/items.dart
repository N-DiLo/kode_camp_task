import 'package:flutter/material.dart';
import 'package:kode_camp_task/task_2/model/app_model.dart';

class Items extends StatelessWidget {
  const Items({
    super.key,
    required this.appModel,
  });
  final AppModel appModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
              title: Center(
                child: Text(
                  appModel.title,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff191454),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Image.asset(
                          appModel.imgDir,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '\$${appModel.price}',
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff191454),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
        child: Card(
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(),
                  child: Image.asset(appModel.imgDir)),
              title: Text(appModel.title),
              titleTextStyle: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xff191454),
              ),
              subtitle: Text('\$${appModel.price}'),
              subtitleTextStyle: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xff191454),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
