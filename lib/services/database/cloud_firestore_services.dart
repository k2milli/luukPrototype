import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:luuk/models/user_model.dart';

class CloudFirestoreServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> saveCredentialsToCloud({UserModel userModel}) async {
    return await _firebaseFirestore
        .collection("Users")
        .doc(userModel.id)
        .set(userModel.toMap());
  }

  Stream<DocumentSnapshot> getUserCredentialsFromCloud({String id}) {
    return _firebaseFirestore.collection("Users").doc(id).snapshots();
  }
}
