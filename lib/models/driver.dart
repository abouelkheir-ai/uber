import 'package:cloud_firestore/cloud_firestore.dart';

class Driver {
  final bool? available;
  final String? carModel;
  final String? carPlate;
  final String? createdAt;
  final String? driverId;
  final String? email;
  final String? name;
  final String? phone;
  final String? profilePicUrl;
  final double? longitude;
  final double? latitude;

  Driver({
    this.available,
    this.carModel,
    this.carPlate,
    this.createdAt,
    this.driverId,
    this.email,
    this.name,
    this.phone,
    this.profilePicUrl,
    this.longitude,
    this.latitude,
  });

  factory Driver.fromJson(Map<String,dynamic> json){
    return Driver(
      available: json['available'],
      carModel: json['carModel'],
      carPlate: json['carPlate'],
      createdAt: json['createdAt'],
      driverId: json['driverId'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      profilePicUrl: json['profilePicUrl'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
  factory Driver.fromFireStore(QueryDocumentSnapshot<Object?> json){
    return Driver(
      available: json['available'],
      carModel: json['carModel'],
      carPlate: json['carPlate'],
      createdAt: json['createdAt'],
      driverId: json['driverId'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      profilePicUrl: json['profilePicUrl'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'available': available,
      'carModel': carModel,
      'carPlate': carPlate,
      'createdAt': createdAt,
      'driverId': driverId,
      'email': email,
      'name': name,
      'phone': phone,
      'profilePicUrl': profilePicUrl,
      'longitude': longitude,
      'latitude': latitude,
    };
}
}