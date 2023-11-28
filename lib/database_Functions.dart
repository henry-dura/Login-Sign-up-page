import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addUser(String name, String company, int age) {
  // Call the user's CollectionReference to add a new user
  return users
      .doc(name)
      .set({
    'full_name': name, // John Doe
    'company': company, // Stokes and Sons
    'age': age // 42
  },)
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}


Future<void> updateUser(id,update) {
  return users
      .doc(id)
      .update(update)
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future<void> deleteUser(deleteId) {
  return users
      .doc(deleteId)
      .delete()
      .then((value) => print("User Deleted"))
      .catchError((error) => print("Failed to delete user: $error"));
}