import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

Future<void> addUser(User user) async {
  try {
    // Get a reference to the Firestore collection
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Users Collection');
  

    // Add a new document with a generated ID
    await usersCollection.add({
      'name': user.name,
      'latitude':user.latitude,
      'longitude':user.longitude,
    });
   
    print('User added successfully');
  } catch (e, stackTrace) {
    print('Error adding user: $e');
    print('Stack trace: $stackTrace');
  }
}