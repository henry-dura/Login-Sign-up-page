import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


signUp(String emailAddress,String password ) async{
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    print('SUCCESS!!!!!!!!!!!!!!!');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }

}


Future<void> signIn(String emailAddress,String password) async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
    );
    print('Signed In very well');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }

}

// Future<void> signInWithEmailAndPassword(String email, String password) async {
//   try {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     // Sign-in successful, navigate to the next screen.
//     // You can use Navigator to navigate to a new page or update the UI accordingly.
//   } catch (e) {
//     // Handle sign-in errors (e.g., incorrect email or password).
//     print('Sign-in error: $e');
//   }
// }


