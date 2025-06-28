class AuthEntity {
  final String accessToken;
  // final String? refreshToken;
  final String id;
  final String role;
  final bool locked;

  AuthEntity({
    required this.accessToken,
    // this.refreshToken,
    required this.id,
    required this.role,
    required this.locked,
  });
}