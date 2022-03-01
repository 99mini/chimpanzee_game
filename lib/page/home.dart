import 'package:chimpanzee_game/controller/app_controller.dart';
import 'package:chimpanzee_game/page/detail.dart';
import 'package:chimpanzee_game/page/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<AppController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time: ${controller.timeCount}',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Level: ${controller.level}',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Get.to(
                      Setting(),
                      transition: Transition.noTransition,
                    );
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                controller.initGame();
                Get.to(
                  Detail(),
                  transition: Transition.noTransition,
                );
              },
              child: Container(
                width: Get.width * 0.2,
                height: Get.width * 0.2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 5,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
