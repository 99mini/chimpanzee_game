import 'package:chimpanzee_game/controller/app_controller.dart';
import 'package:chimpanzee_game/page/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultDialog extends GetView<AppController> {
  const ResultDialog({Key? key}) : super(key: key);

  Widget _confirmBtn() {
    return TextButton(
      onPressed: () {
        controller.level = 1;
        controller.timeCount = 0;
        Get.to(
          const Home(),
          transition: Transition.noTransition,
        );
      },
      child: const Text(
        'Restart',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _resultRow({
    required String title,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: Get.width * 0.7,
      height: Get.height * 0.5,
      child: Column(children: [
        _resultRow(
          title: 'Level',
          value: '${controller.level}',
        ),
        _resultRow(
          title: 'Time',
          value: '${controller.timeCount}',
        ),
        const Spacer(),
        _confirmBtn(),
      ]),
    );
  }
}
