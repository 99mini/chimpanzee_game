import 'package:chimpanzee_game/controller/detail_controller.dart';
import 'package:chimpanzee_game/page/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<DetailController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.initGame();
                    Get.to(Detail(), transition: Transition.noTransition);
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
                Spacer(),
                Column(
                  children: [
                    Text(
                      'Time: ${controller.timeCount}',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Level: ${controller.level}',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
