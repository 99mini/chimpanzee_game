import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ResultComponent extends StatelessWidget {
  final int level;
  final double time;

  const ResultComponent({
    Key? key,
    required this.level,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.7,
      height: Get.height * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('level: ${this.level}'),
          Text('time: ${this.time}'),
        ],
      ),
    );
  }
}
