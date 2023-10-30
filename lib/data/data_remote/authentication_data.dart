import 'dart:convert';
import 'package:loggy/loggy.dart';
import 'package:http/http.dart' as http;

class AuthenticationDatatasource {
  Future<String> login(String baseUrl, String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": email,
        "password": password,
      }),
    );
    print(email);
    print(password);
    logInfo(response.statusCode);
    if (response.statusCode == 200) {
      logInfo(response.body);
      final data = jsonDecode(response.body);
      return Future.value(data['access_token']);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
  }

  Future<bool> signUp(String baseUrl, String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "firstname": email,
        "lastname": email,
        "email": email,
        "colegio": email,
        "grado": email,
        "Fecha de Nacimiento": email,
        "password": password,
        "Difficult": email,
      }),
    );

    logInfo(response.statusCode);
    if (response.statusCode == 200) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
  }

  Future<bool> logOut() async {
    return Future.value(true);
  }
}
