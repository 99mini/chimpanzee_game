import 'dart:async';
import 'dart:math';

import 'package:chimpanzee_game/page/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/result_component.dart';

class DetailController extends GetxController {
  int level = 1;
  int _counter = 1;

  final _delayTime = 3;

  late var startTime;

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
    startTime = DateTime.now().millisecondsSinceEpoch ~/ 10;
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
            (DateTime.now().millisecondsSinceEpoch ~/ 10 - startTime)
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
          (DateTime.now().millisecondsSinceEpoch ~/ 10 - startTime).toDouble();
      timeCount += diffSecond / 100;

      Get.defaultDialog(
          title: "Game Over",
          titleStyle: TextStyle(),
          content: ResultComponent(
            level: level - 1,
            time: timeCount,
          ),
          onConfirm: () {
            level = 1;
            timeCount = 0;
            Get.to(Home(), transition: Transition.noTransition);
          });
    }
  }
}
