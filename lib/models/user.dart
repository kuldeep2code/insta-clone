import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List follwers;
  final List following;

  const UserModel({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.follwers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "bio": bio,
        "followers": follwers,
        "following": following,
      };
  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      email: snapshot["email"],
      uid: snapshot["uid"],
      photoUrl: snapshot["photoUrl"],
      username: snapshot["username"],
      bio: snapshot["bio"],
      follwers: snapshot["followers"],
      following: snapshot["following"],
    );
  }
}
