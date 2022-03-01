import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  static void createDoc({required int level, required double time}) {
    FirebaseFirestore.instance.collection('results').add({
      'level': level,
      'time': time,
    });
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readDocs() {
    var querySnapshot = FirebaseFirestore.instance
        .collection('results')
        .orderBy('level', descending: true)
        .orderBy('time')
        .snapshots();
    return querySnapshot;
  }

  static void deleteDoc({required String docID}) {
    FirebaseFirestore.instance.collection('results').doc(docID).delete();
  }
}
