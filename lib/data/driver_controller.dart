import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uber/models/driver.dart';

class HandleDriverData {
  final FirebaseFirestore firestore;
  HandleDriverData(this.firestore);

  Future<void> addDriver(Driver driver) async {
    try {
      CollectionReference driversCollection =
          firestore.collection('Drivers Collection');
      await driversCollection.add(driver.toJson());
      print('User added successfully');
    } catch (e, stackTrace) {
      print('Error adding user: $e');
      print('Stack trace: $stackTrace');
    }
  }

  Future<void> updateDriver() async {
    try {
      DocumentReference docRef = firestore
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

  Future<Driver> getDriverLocation(String uniqueId) async {
    try {
      DocumentSnapshot docSnapshot =
          await firestore.collection('Drivers Collection').doc(uniqueId).get();

      if (docSnapshot.exists) {
        Driver driver = Driver();
        Map<String, dynamic> driverData =
            docSnapshot.data()! as Map<String, dynamic>;
        driver = Driver.fromJson(driverData);
        return driver;
      } else {
        print('Driver document does not exist');
        return Driver();
      }
    } catch (e, stackTrace) {
      print('Error getting driver location: $e');
      print('Stack trace: $stackTrace');
      return Driver();
    }
  }

  Future<List<Driver>> getAllDriversDetails() async {
    try {
      List<Driver> drivers = [];
      QuerySnapshot querySnapshot =
          await firestore.collection('Drivers Collection').get();

      for (var doc in querySnapshot.docs) {
        if (doc.exists) {
          print("exist");
          Driver.fromFireStore(doc);
          drivers.add(Driver.fromFireStore(doc));
        }
      }
      return drivers;
    } catch (e, stackTrace) {
      print('Error getting driver location: $e');
      print('Stack trace: $stackTrace');
      return [];
    }
  }
}
