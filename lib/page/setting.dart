import 'package:chimpanzee_game/component/reset_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/record_history_dialog.dart';

class Setting extends StatelessWidget {
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

  // login btn card
  Widget _loginCard() {
    return GestureDetector(
      onTap: () => Get.toNamed('login'),
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

  Widget _profileCard() {
    return Card();
  }

  // delete record history dialog
  void _showWarningDialog() {
    Get.dialog(
      const Dialog(
        child: ResetDialog(),
      ),
    );
  }

  void _showRecordHistoryDialog() {
    Get.dialog(
      const Dialog(
        child: ResultHistoryDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 24,
              )),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // StreamBuilder(builder: (context, snapshot) {
          //   if (!snapshot.hasData) {
          //     return _loginCard();
          //   } else {
          //     return _profileCard();
          //   }
          // }),
          _selectBtn(
            onTap: () => _showRecordHistoryDialog(),
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
