import 'dart:convert';

class ChangePasswordReq {
  String oldPassword;
  String newPassword;

  ChangePasswordReq({
    required this.oldPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }
  String toJson() => json.encode(toMap());
}