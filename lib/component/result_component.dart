import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultComponent extends StatelessWidget {
  final int level;
  final double time;

  const ResultComponent({
    Key? key,
    required this.level,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * 0.7,
        height: Get.height * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('results').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text("Loading...");
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
