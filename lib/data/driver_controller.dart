import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uber/models/driver.dart';

Future<void> addDriver(Driver driver) async {
  try {
    // Get a reference to the Firestore collection
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Drivers Collection');
  

    // Add a new document with a generated ID
    await usersCollection.add({
      'name': driver.name,
      'available': driver.available,
      'carPlate': driver.carPlate,
      'email': driver.email,
    });
   
    print('User added successfully');
  } catch (e, stackTrace) {
    print('Error adding user: $e');
    print('Stack trace: $stackTrace');
  }
}

Future<void> updateDriver() async {
  try {

    DocumentReference docRef = FirebaseFirestore.instance
        .collection('Drivers Collection')
        .doc('thtsiOr3awawaH35ve1P');

    await docRef.update({
      'name': 'mohamed',
    });

    print('User update successfully');
  } catch (e, stackTrace) {
    print('Error update user: $e');
    print('Stack trace: $stackTrace');
  }
}


// Future<Map<String, dynamic>> getDriverLocation() async {
Future<Map<String, dynamic>> getDriverLocation() async {

  try {
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('Drivers Collection')
        .doc('thtsiOr3awawaH35ve1P') // Replace with your document ID
        .get();

    if (docSnapshot.exists) {
      // Extract latitude and longitude fields from the document
      Map<String, dynamic> driverData = docSnapshot.data()! as Map<String, dynamic> ;
      double latitude = driverData['latitude'];
      double longitude = driverData['longitude'];
      // Return latitude and longitude as a map
      return {'latitude': latitude, 'longitude': longitude};
    } else {
      print('Driver document does not exist');
      return {};
    }
  } catch (e, stackTrace) {
    print('Error getting driver location: $e');
    print('Stack trace: $stackTrace');
    return {};
  }
}

