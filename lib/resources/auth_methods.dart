import "dart:typed_data";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:insta_clone/models/user.dart";
import "package:insta_clone/resources/storage_methods.dart";

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snapshot =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return UserModel.fromSnap(snapshot);
  }

  //sign up
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = ".........";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        //register user
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        String photoUrl = await StorageMethods()
            .uploadImageToString("profilePics", file, false);

        //add user to database
        UserModel user = UserModel(
          email: email,
          uid: userCredential.user!.uid,
          photoUrl: photoUrl,
          username: username,
          bio: bio,
          follwers: [],
          following: [],
        );

        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(user.toJson());
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the field";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
