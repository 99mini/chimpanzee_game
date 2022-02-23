import 'dart:async';
import 'dart:math';

import 'package:chimpanzee_game/page/home.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  int _level = 1;
  RxList<String> gameList = RxList<String>.filled(50, '');
  final _delayTime = 3;
  RxBool onGame = false.obs;
  int _counter = 1;

  @override
  void onInit() {
    print(onGame);
    super.onInit();
  }

  void initGame() {
    print("initGame");
    gameList = RxList<String>.filled(50, '');
    for (int i = 1; i <= (_level ~/ 3) + 5; i++) {
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
      print('Done delay');
    });
  }

  void playGame(click) {
    if (_counter.toString() == click) {
      if (_counter == (_level ~/ 3) + 5) {
        print("complete level $_level");
        _level++;
        Get.to(Home(), transition: Transition.noTransition);
      }
      print('correct...!');
      gameList[gameList.indexOf(click)] = '';
      _counter++;
    } else {
      print('fault...!');
      _level = 1;
      Get.to(Home(), transition: Transition.noTransition);
    }
  }
}
