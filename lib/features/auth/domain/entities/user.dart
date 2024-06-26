import 'package:vales_app/features/auth/domain/entities/address.dart';

class User {
  final String id;
  final String role;
  final String email;
  final String name;
  final String secondName;
  final String firstLastName;
  final String secondLastName;
  final String phone;
  final String birthdate;
  final Address address;
  final String token;
  final bool isActive;
  final String gender;

  User(
      {required this.id,
      required this.role,
      required this.email,
      required this.name,
      required this.secondName,
      required this.firstLastName,
      required this.secondLastName,
      required this.phone,
      required this.birthdate,
      required this.address,
      required this.token,
      required this.isActive,
      required this.gender});
}
