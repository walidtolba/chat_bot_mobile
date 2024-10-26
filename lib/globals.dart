import 'dart:convert';
import 'package:http/http.dart';

String token = '';
String lastEmail = '';
String K_CHATBOT_SERVER_URL = '192.168.85.81';
String K_CHATBOT_SERVER_PORT = '8000';

Future<String?> login(String email, String password) async {
  var url = Uri.parse('http://${K_CHATBOT_SERVER_URL}:${K_CHATBOT_SERVER_PORT}/users/login/');
  final response = await post(url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }));
  Map data = json.decode(response.body);
  return data['token'];
}