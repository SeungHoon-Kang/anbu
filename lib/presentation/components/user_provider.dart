import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _email = "";
  String _password = "";
  String _gender = "";
  String _birthDate = "";
  String _nickname = "";

  String get email => _email;
  String get password => _password;
  String get gender => _gender;
  String get birthDate => _birthDate;
  String get nickname => _nickname;

  void set email(String input_email) {
    _email = input_email;
    notifyListeners();
  }

  void set password(String input_password) {
    _password = input_password;
    notifyListeners();
  }

  void set univ(String input_gender) {
    _gender = input_gender;
    notifyListeners();
  }

  void set birthDate(String input_birthDate) {
    _password = input_birthDate;
    notifyListeners();
  }

  void set nickname(String input_nickname) {
    _gender = input_nickname;
    notifyListeners();
  }
}
