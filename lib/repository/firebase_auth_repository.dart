import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:luuk/models/user_model.dart';
import 'package:luuk/services/auth/firebase_auth_services.dart';
import 'package:luuk/services/database/cloud_firestore_services.dart';

class FirebaseAuthRepository extends ChangeNotifier {
  final _firebaseBaseAuthServices = FirebaseAuthServices();
  final _cloudFirestoreServices = CloudFirestoreServices();

  Future<void> registerAndSaveCreds(
      {String email, String password, String fullName, int phoneNumber}) async {
    await _firebaseBaseAuthServices
        .registerUser(email: email, password: password)
        .then(
      (value) async {
        UserModel userModel = UserModel(
            email: value.user.email,
            fullName: fullName,
            id: value.user.uid,
            phoneNumber: phoneNumber,
            photoUrl: value.user.photoURL,
            registeredOn: DateTime.now());
        await _cloudFirestoreServices.saveCredentialsToCloud(
            userModel: userModel);
      },
    );
  }

  Future<UserCredential> signInUser({String email, String password}) async {
    return await _firebaseBaseAuthServices.signInUser(
        email: email, password: password);
  }

  Future<void> googleSignIn({int phoneNumber}) async {
    await _firebaseBaseAuthServices.googleSignIn().then(
      (value) async {
        print(value.user.phoneNumber ?? "" + "emir dilony");
        UserModel userModel = UserModel(
          email: value.user.email,
          fullName: value.user.displayName,
          id: value.user.uid,
          phoneNumber: phoneNumber,
          photoUrl: value.user.photoURL,
          registeredOn: DateTime.now(),
        );
        await _cloudFirestoreServices.saveCredentialsToCloud(
            userModel: userModel);
      },
    );
  }

  Future<void> signOut() async {
    await _firebaseBaseAuthServices.signOut();
  }
}
