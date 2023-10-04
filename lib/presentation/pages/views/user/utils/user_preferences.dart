import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static final myUser = User(
    id: 'some-id',
    imagePath: 'https://...',
    name: 'Sarah Abs',
    email: 'sarah.abs@gmail.com',
    password: 'somepassword',
    about: 'Certified Personal Trainer...',
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    if (json == null) return myUser;

    try {
      return User.fromJson(jsonDecode(json) as Map<String, dynamic>);
    } catch (e) {
      // If error decoding json, return default user
      return myUser;
    }
  }
}
