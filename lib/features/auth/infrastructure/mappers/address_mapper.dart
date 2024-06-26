import 'package:vales_app/features/auth/domain/entities/address.dart';

class AddressMapper {
  static Address addressJsonToMap(Map<String, dynamic> json) => Address(
        street: json['street'],
        number: json['number'],
        neighborhood: json['neighborhood'],
        city: json['city'],
        state: json['state'],
        zip: json['zip_code'],
      );
}
