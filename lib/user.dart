import 'dart:ffi';

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String dob;
  final String role;
  final String userActivated;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.dob,
    required this.role,
    required this.userActivated,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['ID'],
      name: json['Name'],
      email: json['Email'],
      phone: json['Phone'],
      address: json['Address'],
      dob: json['DOB'],
      role: json['role'],
      userActivated: json['user_activated'],
      password: json['Password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'Name': name,
      'Email': email,
      'Phone': phone,
      'Address': address,
      'DOB': dob,
      'role': role,
      'user_activated': userActivated,
      'Password': password,
    };
  }
}
