import 'package:chimpanzee_game/helper/firebase_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultComponent extends StatelessWidget {
  const ResultComponent({Key? key}) : super(key: key);

  Widget _resultTextBox({required String text}) {
    return Expanded(
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * 0.7,
        height: Get.height * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        // display docs order by rank
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseHelper.readDocs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: Text("Loading..."));
              default:
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          _resultTextBox(
                            text: '${index + 1}',
                          ),
                          _resultTextBox(
                            text: '${snapshot.data!.docs[index]['level']}',
                          ),
                          _resultTextBox(
                            text: '${snapshot.data!.docs[index]['time']}',
                          ),
                        ],
                      );
                    });
            }
          },
        ));
  }
}
