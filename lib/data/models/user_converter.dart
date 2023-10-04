import '../../presentation/views/user/model/user.dart';

class UserConverter {
  UserConverter._();
  static final _instance = UserConverter._();
  factory UserConverter() => _instance;

  User fromJson(Map<String, Object?> data) {
    return User(
      id: data["id"]?.toString() ?? "",
      name: data["name"]?.toString() ?? "",
      email: data["email"]?.toString() ?? "",
      password: data["password"]?.toString() ?? "",
      imagePath: data["imagePath"]?.toString() ?? "",
      about: data["about"]?.toString() ?? "",
      isDarkMode: data["isDarkMode"] as bool? ?? false,
    );
  }

  Map<String, Object?> toJson(User user) => {
        "id": user.id,
        "name": user.name,
        "email": user.email,
        "password": user.password,
        "imagePath": user.imagePath,
        "about": user.about,
        "isDarkMode": user.isDarkMode,
      };
}
