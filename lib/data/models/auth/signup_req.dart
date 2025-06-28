import 'dart:convert';

class SignUpReqParams {
  final String accountName;
  final String email;
  final String password;

  SignUpReqParams({
    required this.accountName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      'account_name': accountName,
      'email': email,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}