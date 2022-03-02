import 'dart:math';

import 'package:chimpanzee_game/helper/firebase_helper.dart';
import 'package:chimpanzee_game/page/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/result_component.dart';

class AppController extends GetxController {
  int level = 1;
  int _counter = 1;

  late var _startTime;

  late RxList<String> gameList;
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
    _startTime = DateTime.now().millisecondsSinceEpoch;
  }

  void playGame(click) {
    // 1번을 클릭한 경우 게임 시작
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
            (DateTime.now().millisecondsSinceEpoch - _startTime).toDouble();
        timeCount += diffSecond.floor() / 1000;
      }
      print('correct...!');
      gameList[gameList.indexOf(click)] = '';
      _counter++;
      // 1번을 누르지 않아 게임이 시작되지 않은 경우
    } else if (onGame.isFalse) {
      return;

      // 틀린 경우
    } else {
      print('fault...!');
      var diffSecond =
          (DateTime.now().millisecondsSinceEpoch - _startTime).toDouble();
      timeCount += diffSecond.floor() / 1000;
      // 파이어 베이스에 기록 쓰기
      FirebaseHelper.createDoc(level: level, time: timeCount);
      // 결과창 보여주기
      showResultDialog(
        title: "Game Over",
        confirmTitle: "Restart",
        barrierDismissible: false,
      );
    }
  }

  // 결과창 다이얼로그
  void showResultDialog(
      {required String title,
      required bool barrierDismissible,
      String? confirmTitle}) {
    Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(),
      barrierDismissible: barrierDismissible,
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
          ResultComponent(),
        ],
      ),
      confirm: GestureDetector(
        onTap: () {
          level = 1;
          timeCount = 0;
          Get.to(Home(), transition: Transition.noTransition);
        },
        child: !barrierDismissible
            ? Container(
                width: Get.width * 0.2,
                height: Get.width * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    confirmTitle!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
