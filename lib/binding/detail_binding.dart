import 'package:chimpanzee_game/controller/detail_controller.dart';
import 'package:get/get.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailController());
  }
}
