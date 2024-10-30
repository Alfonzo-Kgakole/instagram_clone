import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instragram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up users
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        String photoURL = await StorageMethods()
            .uploadImageToStorage("ProfilePics", file, false);

        // adding user to database
        await _firestore.collection("user").doc(cred.user!.uid).set({
          'username': username,
          "uid": cred.user!.uid,
          "email": email,
          "bio": bio,
          "photoURL": photoURL,
          "followers": [],
          "following": [],
        });
        res = "Success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == "invalid-email") {
        res = "The email is badly formatted";
      } else if (err.code == "Password should be at least 6 characters") {
        res = "password should be 9 or more characters long";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
