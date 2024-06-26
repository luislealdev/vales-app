import 'package:vales_app/features/auth/domain/entities/user.dart';
import 'package:vales_app/features/auth/infrastructure/mappers/address_mapper.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
      id: json['id'],
      role: json['role'],
      email: json['email'],
      name: json['name'],
      secondName: json['second_name'],
      firstLastName: json['first_lastName'],
      secondLastName: json['second_lastName'],
      phone: json['phone'],
      birthdate: json['birthdate'],
      address: AddressMapper.addressJsonToMap(json['address']),
      token: json['token'],
      isActive: json['isActive'],
      gender: json['gender']);
}
