import 'dart:async';
import 'dart:math';

import 'package:chimpanzee_game/page/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/result_component.dart';

class DetailController extends GetxController {
  int level = 1;
  int _counter = 1;

  late var _startTime;

  RxList<String> gameList = RxList<String>.filled(40, '');
  RxBool onGame = false.obs;
  double timeCount = 0.0;

  @override
  void onInit() {
    print(onGame);
    super.onInit();
  }

  void initGame() {
    print("initGame");
    gameList = RxList<String>.filled(40, '');
    int number_count = min((level ~/ 3) + 5, 20);

    for (int i = 1; i <= number_count; i++) {
      int tmp = Random().nextInt(gameList.length);
      while (gameList[tmp] != '') {
        tmp = Random().nextInt(gameList.length);
      }
      print(tmp);
      gameList[tmp] = '$i';
    }
    onGame(false);
    _counter = 1;
    _startTime = DateTime.now().millisecondsSinceEpoch ~/ 10;
  }

  void playGame(click) {
    if (_counter.toString() == click) {
      if (_counter.toString() == '1') {
        onGame(true);
        print('Start Game...Start Timer');
      }
      // 마지막 번호를 눌렀을 경우
      int number_count = min((level ~/ 3) + 5, 20);
      if (_counter == number_count) {
        print("complete level $level");
        level++;
        Get.to(Home(), transition: Transition.noTransition);

        var diffSecond =
            (DateTime.now().millisecondsSinceEpoch ~/ 10 - _startTime)
                .toDouble();
        timeCount += diffSecond / 100;
      }
      print('correct...!');
      gameList[gameList.indexOf(click)] = '';
      _counter++;
    } else if (onGame.isFalse) {
      return;
    } else {
      print('fault...!');
      var diffSecond =
          (DateTime.now().millisecondsSinceEpoch ~/ 10 - _startTime).toDouble();
      timeCount += diffSecond / 100;

      _showResultDialog();
    }
  }

  void _showResultDialog() {
    Get.defaultDialog(
      title: "Game Over",
      titleStyle: TextStyle(),
      barrierDismissible: false,
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Rank',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Level',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Time',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          ResultComponent(
            level: level - 1,
            time: timeCount,
          ),
        ],
      ),
      confirm: GestureDetector(
        onTap: () {
          level = 1;
          timeCount = 0;
          Get.to(Home(), transition: Transition.noTransition);
        },
        child: Container(
          width: Get.width * 0.2,
          height: Get.width * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          child: const Center(
            child: Text(
              "Restart",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
