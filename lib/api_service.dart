import 'dart:convert';
import 'dart:io';
import 'package:databse_test/user.dart';
import 'package:http/http.dart' as http;

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class ApiService {
  static const String baseUrl = 'https://192.168.56.1/flutter/api';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/get_users.php'));
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<User> users = body.map((dynamic item) => User.fromJson(item)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<void> addUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add_user.php'),
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add user');
    }
  }
}

