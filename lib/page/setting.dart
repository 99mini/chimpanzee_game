import 'package:chimpanzee_game/controller/app_controller.dart';
import 'package:chimpanzee_game/helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Setting extends GetView<AppController> {
  const Setting({Key? key}) : super(key: key);

  Widget _selectBtn({
    required Function onTap,
    required String title,
    Color? color = Colors.white,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _dialogBtn({
    required String title,
    required Function onTap,
    Color? containerColor = Colors.blue,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _dialogBottomBtns(
      {required String confrimText, required String cancelText}) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: _dialogBtn(
            title: cancelText,
            onTap: () {
              FirebaseHelper.deleteAllDocs();
              Get.back();
            },
            containerColor: Colors.red,
          ),
        ),
        Expanded(
          flex: 9,
          child: _dialogBtn(
            title: confrimText,
            onTap: () => Get.back(),
          ),
        ),
      ],
    );
  }

  // login btn card
  Widget _loginCard() {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.person,
              color: Colors.black,
              size: 50,
            ),
            Text(
              "Login",
              style: TextStyle(
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }

  // dialog component
  Widget _dialogComponent({required String subtitle}) {
    return Container(
      width: Get.width * 0.5,
      height: Get.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: _dialogBottomBtns(
            cancelText: 'Delete',
            confrimText: 'Close',
          ),
        ),
      ]),
    );
  }

  // delete record history dialog
  void _showWarningDialog() {
    Get.dialog(
      Dialog(
        child: _dialogComponent(
          subtitle: 'Are you really want to delete?',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _loginCard(),
          _selectBtn(
            onTap: () => controller.showResultDialog(
              title: 'Record',
              barrierDismissible: true,
            ),
            title: 'Record',
          ),
          _selectBtn(
            onTap: () => _showWarningDialog(),
            title: 'Reset Record',
            color: Colors.red,
          ),
        ]),
      ),
    );
  }
}
