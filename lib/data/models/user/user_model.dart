class UserModel {
  final String id;
  final String? imageLink;
  final String? fullName;
  final String accountName;
  final String? birthday;
  final String email;
  final String? numberPhone;
  final bool isLocked;

  UserModel({
    required this.id,
    this.imageLink,
    this.fullName,
    required this.accountName,
    this.birthday,
    required this.email,
    this.numberPhone,
    required this.isLocked,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      imageLink: json['image_link'] as String?,
      fullName: json['full_name'] as String?,
      accountName: json['account_name'] as String,
      birthday: json['birthday'] as String?,
      email: json['email'] as String,
      numberPhone: json['numberphone'] as String?,
      isLocked: json['is_locked'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_link': imageLink,
      'full_name': fullName,
      'account_name': accountName,
      'birthday': birthday,
      'email': email,
      'numberphone': numberPhone,
      'is_locked': isLocked,
    };
  }

}