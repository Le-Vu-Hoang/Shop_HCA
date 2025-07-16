class AddressEntity {
  final String id;
  final String address;
  final String ward;
  final String city;
  final String country;
  final String zipCode;
  final bool isDefault;

  AddressEntity({
    required this.id,
    required this.address,
    required this.ward,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.isDefault,
  });
}