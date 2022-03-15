import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/firebase_helper.dart';

class ResetDialog extends StatelessWidget {
  const ResetDialog({Key? key}) : super(key: key);

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

  Widget _dialogBottomBtns({
    required String confrimText,
    required String cancelText,
  }) {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.5,
      height: Get.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Expanded(
          flex: 5,
          child: Center(
            child: Text(
              'Are you really want to delete?',
              style: TextStyle(
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
}
