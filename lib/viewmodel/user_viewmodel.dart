import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../model/user_model.dart';
import 'dart:convert';
import '../utils/string_helper.dart';
import 'package:http/http.dart' as http;

class UserViewModel extends ChangeNotifier {
  late User? currentUser;

  UserViewModel() {
    currentUser = null;
  }

  Future<void> LoginUser(String email, String userName) async {
    String searchUrl =
        getApiBaseUrl() + "users?email=$email&&username=$userName";
    final response = await http.get(Uri.parse(searchUrl));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body) as List;
      if (parsed.length > 0) {
        currentUser = User.fromJson(parsed[0]);
        notifyListeners();
      }
    }
  }

  bool isLoggedIn() {
    return currentUser != null;
  }
}
