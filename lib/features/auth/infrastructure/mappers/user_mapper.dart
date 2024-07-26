import 'package:vales_app/features/auth/domain/entities/user.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
      role: json['role'],
      token: json['token'],
      isActive: json['isActive']);
}
