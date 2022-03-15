import 'package:chimpanzee_game/helper/firebase_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultHistoryDialog extends StatelessWidget {
  const ResultHistoryDialog({Key? key}) : super(key: key);

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

  Widget _dialogColText({
    required String title,
  }) {
    return Expanded(
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.7,
      height: Get.height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      // display docs order by rank
      child: Column(
        children: [
          const Text(
            'Record',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Row(
            children: [
              _dialogColText(title: 'Rank'),
              _dialogColText(title: 'Level'),
              _dialogColText(title: 'Time'),
            ],
          ),
          Expanded(
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
            ),
          ),
        ],
      ),
    );
  }
}
