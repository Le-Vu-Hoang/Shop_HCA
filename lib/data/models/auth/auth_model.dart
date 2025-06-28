class AuthModel {
  final String accessToken;
  // final String? refreshToken;
  final String id;
  final String role;
  final bool locked;

  AuthModel({
    required this.accessToken,
    // this.refreshToken,
    required this.id,
    required this.role,
    required this.locked,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return AuthModel(
      accessToken: json['access'],
      id: data['id'],
      role: data['role'],
      locked: data['locked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access': accessToken,
      'data': {
        'id': id,
        'role': role,
        'locked': locked,
      }
    };
  }
}