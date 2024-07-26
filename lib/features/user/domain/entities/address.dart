class Address {
  final String id;
  final String userId;
  final String street;
  final String city;
  final String state;
  final String country;
  final String postalCode;

  Address({
    required this.id,
    required this.userId,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      userId: json['user_id'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postalCode: json['postal_code'],
    );
  }

  get number => null;

  get neighborhood => null;

  get zipCode => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'postal_code': postalCode,
    };
  }
}
