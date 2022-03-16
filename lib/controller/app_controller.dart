import 'dart:math';

import 'package:chimpanzee_game/component/result_dialog.dart';
import 'package:chimpanzee_game/helper/firebase_helper.dart';
import 'package:chimpanzee_game/page/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  int level = 1;
  int _counter = 1;

  late var _startTime;

  late RxList<String> gameList;
  RxBool onGame = false.obs;
  double timeCount = 0.0;

  double _fixDecimalPoint(double num) => double.parse(num.toStringAsFixed(3));

  void _showResultDialog() {
    Get.dialog(
      const Dialog(
        child: ResultDialog(),
      ),
    );
  }

  void initGame() {
    gameList = RxList<String>.filled(40, '');
    int number_count = min((level ~/ 3) + 5, 20);

    for (int i = 1; i <= number_count; i++) {
      int tmp = Random().nextInt(gameList.length);
      while (gameList[tmp] != '') {
        tmp = Random().nextInt(gameList.length);
      }

      gameList[tmp] = '$i';
    }
    onGame(false);
    _counter = 1;
    _startTime = DateTime.now().millisecondsSinceEpoch;
  }

  void playGame(click) {
    // 1번을 클릭한 경우 게임 시작
    if (_counter.toString() == click) {
      if (_counter.toString() == '1') {
        onGame(true);
      }
      // 마지막 번호를 눌렀을 경우
      int number_count = min((level ~/ 3) + 5, 20);
      if (_counter == number_count) {
        level++;
        Get.to(
          const Home(),
          transition: Transition.noTransition,
        );

        var diffSecond =
            (DateTime.now().millisecondsSinceEpoch - _startTime).toInt();
        timeCount += diffSecond.floor() / 1000;
        timeCount = _fixDecimalPoint(timeCount);
      }
      gameList[gameList.indexOf(click)] = '';
      _counter++;
      // 1번을 누르지 않아 게임이 시작되지 않은 경우
    } else if (onGame.isFalse) {
      return;
      // 틀린 경우
    } else {
      // 파이어 베이스에 기록 쓰기
      FirebaseHelper.createDoc(
        level: level,
        time: timeCount,
      );

      _showResultDialog();
    }
  }
}
