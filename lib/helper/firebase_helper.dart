import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  // create new doc
  static Future<DocumentReference<Map<String, dynamic>>> createDoc({
    required int level,
    required double time,
  }) {
    var resp = FirebaseFirestore.instance.collection('results').add({
      'level': level,
      'time': time,
    });
    return resp;
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
