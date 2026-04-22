class LoginRequest {
  final String username;
  final String password;
  final int expiresInMins;

  const LoginRequest({
    required this.username,
    required this.password,
    required this.expiresInMins,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'expiresInMins': expiresInMins,
    };
  }
}
