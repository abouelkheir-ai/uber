class Driver {
  final bool? available;
  final String? carModel;
  final String? carPlate;
  final String? createdAt;
  final String? driverId;
  final String email;
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
    required this.email,
    this.name,
    this.phone,
    this.profilePicUrl,
    this.longitude,
    this.latitude,
  });
}
