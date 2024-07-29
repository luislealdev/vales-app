class Address {
  final String id;
  final String userId;
  final String street;
  final String number;
  final String city;
  final String state;
  final String country;
  final String zipCode;
  final String neighborhood;

  Address({
    required this.id,
    required this.number,
    required this.userId,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
    required this.neighborhood,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      userId: json['user_id'],
      street: json['street'],
      number: json['number'],
      city: json['city'],
      state: json['state'],
      neighborhood: json['neighborhood'],
      country: json['country'],
      zipCode: json['zip_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'zip_code': zipCode,
      'neighborhood': neighborhood,
      'number': number,
    };
  }
}
