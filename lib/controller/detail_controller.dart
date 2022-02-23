import 'dart:async';
import 'dart:math';

import 'package:chimpanzee_game/page/home.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  int level = 1;
  int _counter = 1;
  final _delayTime = 3;

  RxList<String> gameList = RxList<String>.filled(50, '');
  RxBool onGame = false.obs;
  RxDouble timeCount = 0.0.obs;

  @override
  void onInit() {
    print(onGame);
    super.onInit();
  }

  void initGame() {
    print("initGame");
    gameList = RxList<String>.filled(50, '');
    for (int i = 1; i <= (level ~/ 3) + 5; i++) {
      int tmp = Random().nextInt(gameList.length);
      while (gameList[tmp] != '') {
        tmp = Random().nextInt(gameList.length);
      }
      print(tmp);
      gameList[tmp] = '$i';
    }
    onGame(false);
    _counter = 1;
    _delayTimer();
  }

  void _delayTimer() async {
    Timer(Duration(seconds: _delayTime), () {
      onGame(true);
      print('Start Game...Start Timer');
    });
  }

  void playGame(click) {
    if (_counter.toString() == click) {
      if (_counter == (level ~/ 3) + 5) {
        print("complete level $level");
        level++;
        Get.to(Home(), transition: Transition.noTransition);
      }
      print('correct...!');
      gameList[gameList.indexOf(click)] = '';
      _counter++;
    } else {
      print('fault...!');
      level = 1;
      Get.to(Home(), transition: Transition.noTransition);
    }
  }
}
