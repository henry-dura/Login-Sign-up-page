import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'database_Functions.dart';

class DataMethods extends StatelessWidget {
  const DataMethods({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout))
        ],
        title: const Text('Create Data in Firebase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  addUser('Stephen', 'Facebook', 34);
                },
                child: Text('CREATE')),
            ElevatedButton(onPressed: () {
              updateUser('Arinze',{'company': 'Amazon'});
            }, child: Text('UPDATE')),
            ElevatedButton(onPressed: () {}, child: Text('RETRIEVE')),
            ElevatedButton(onPressed: () {
              deleteUser('Arinzechukwu');
            }, child: Text('DELETE')),
          ],
        ),
      ),
    );
  }
}
