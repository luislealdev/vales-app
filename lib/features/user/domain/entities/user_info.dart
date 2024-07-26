class UserInfo {
  final String id;
  final String userId;
  final String name;
  final String secondName;
  final String firstLastName;
  final String secondLastName;
  final String phone;
  final String birthdate;
  final String gender;

  UserInfo({
    required this.id,
    required this.userId,
    required this.name,
    required this.secondName,
    required this.firstLastName,
    required this.secondLastName,
    required this.phone,
    required this.birthdate,
    required this.gender,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      secondName: json['second_name'],
      firstLastName: json['first_last_name'],
      secondLastName: json['second_last_name'],
      phone: json['phone'],
      birthdate: json['birthdate'],
      gender: json['gender'],
    );
  }

  get email => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'second_name': secondName,
      'first_last_name': firstLastName,
      'second_last_name': secondLastName,
      'phone': phone,
      'birthdate': birthdate,
      'gender': gender,
    };
  }
}
