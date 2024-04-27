class User {
  final String? email;
  final String? createdAt;
  final String? name;
  final String? phone;
  final String? profilePicUrl;
  final double? longitude;
  final double? latitude;

  User(
    this.createdAt,
    this.email,
    this.name,
    this.phone,
    this.profilePicUrl,
    this.longitude,
    this.latitude,
  );
}
