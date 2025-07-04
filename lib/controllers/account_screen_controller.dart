import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ucrypted_app/screens/app_imports.dart';

class AccountScreenController extends GetxController {
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;

  ///
  /// Function to get user data
  ///
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user_data');
    if (userJson != null) {
      final userMap = jsonDecode(userJson);
      userName.value = userMap['firstname'] ?? '';
      userEmail.value = userMap['email'] ?? '';
    }
  }
}
