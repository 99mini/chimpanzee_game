import 'package:chimpanzee_game/page/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultDialog extends StatelessWidget {
  int? level;
  double? timeCount;

  ResultDialog({
    Key? key,
    required int level,
    required double timeCount,
  }) : super(key: key);

  Widget _confirmBtn() {
    return TextButton(
      onPressed: () => Get.to(
        const Home(),
        transition: Transition.noTransition,
      ),
      child: const Text(
        'Restart',
      ),
    );
  }

  Widget _resultRow({
    required String title,
    required String value,
  }) {
    return Row(
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
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.7,
      height: Get.height * 0.5,
      child: Column(children: [
        _resultRow(
          title: 'Level',
          value: '$level',
        ),
        _resultRow(
          title: 'Time',
          value: '$timeCount',
        ),
        _confirmBtn(),
      ]),
    );
  }
}
