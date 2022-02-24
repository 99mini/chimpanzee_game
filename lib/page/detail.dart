import 'package:chimpanzee_game/controller/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail extends GetView<DetailController> {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 1 / 1,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0),
          itemCount: 50,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  if (controller.gameList[index] != '') {
                    controller.playGame(controller.gameList[index]);
                    print(controller.gameList[index]);
                  }
                },
                child: Obx(
                  () => controller.onGame.isTrue &&
                          controller.gameList[index] != ''
                      ? Container(
                          margin: const EdgeInsets.all(2),
                          color: Colors.white,
                        )
                      : Container(
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              "${controller.gameList[index]}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 42,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ));
          },
        ),
      ),
    );
  }
}
