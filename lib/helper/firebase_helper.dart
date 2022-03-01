import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  final String collectionPath = 'results';

  final String fnLevel = 'level';
  final String fnTime = 'time';

  void createDoc(int level, double time) {
    FirebaseFirestore.instance.collection(collectionPath).add({
      fnLevel: level,
      fnTime: time,
    });
  }

  Future<DocumentSnapshot<Object?>> readDoc(String docID) async {
    var documentSnapshot = await FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(docID)
        .get();
    return documentSnapshot;
  }

  void deleteDoc(String docID) {
    FirebaseFirestore.instance.collection(collectionPath).doc(docID).delete();
  }
}
