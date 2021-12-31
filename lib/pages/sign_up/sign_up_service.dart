import 'dart:convert';
import 'package:firebase_learning/shared/constants/routes.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  signUp(String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(Routes.signUp()),
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );

    print("RESPOSTA SIGN_UP_SERVICE:");
    print(response.body);
  }
}