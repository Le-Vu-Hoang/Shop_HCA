class UserEntity {
  final String id;
  final String? fullName;
  final String accountName;
  final String? birthday;
  final String email;
  final String? numberPhone;
  final bool isLocked;

  UserEntity({
    required this.id,
    this.fullName,
    required this.accountName,
    this.birthday,
    required this.email,
    this.numberPhone,
    required this.isLocked,
  });
}