

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreStorageReference {
  const FirestoreStorageReference();



  Future<void> storeinCollection({
    required String collectionName,
    dynamic data
  }) async {
    await FirebaseFirestore.instance.collection(collectionName).add(data);
  }

  
}