import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  // create new doc
  static void createDoc({required int level, required double time}) {
    FirebaseFirestore.instance.collection('results').add({
      'level': level,
      'time': time,
    });
  }

  // read docs order by level DESC, time ASC
  static Stream<QuerySnapshot<Map<String, dynamic>>> readDocs() {
    var querySnapshot = FirebaseFirestore.instance
        .collection('results')
        .orderBy('level', descending: true)
        .orderBy('time')
        .snapshots();
    return querySnapshot;
  }

  // delete doc for id
  static void deleteDoc({required String docID}) {
    FirebaseFirestore.instance.collection('results').doc(docID).delete();
  }

  // delete all docs
  static void deleteAllDocs() {
    FirebaseFirestore.instance.collection('results').get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }
}
