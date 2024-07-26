class User {
  final String role;
  final String token;
  final bool isActive;

  User({
    required this.role,
    required this.token,
    required this.isActive,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      role: json['role'],
      token: json['token'],
      isActive: json['is_active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'token': token,
      'is_active': isActive,
    };
  }
}
