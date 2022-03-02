import 'package:chimpanzee_game/helper/firebase_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultComponent extends StatelessWidget {
  const ResultComponent({Key? key}) : super(key: key);

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
        // TODO 간격 맞추기
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${index + 1}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '${snapshot.data!.docs[index]['level']}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '${snapshot.data!.docs[index]['time']}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      );
                    });
            }
          },
        ));
  }
}
