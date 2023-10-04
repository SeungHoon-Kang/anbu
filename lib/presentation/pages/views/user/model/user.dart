// class UserProfile {
//   final String id; // 사용자 식별자
//   final String username; // 사용자 이름
//   final String phoneNumber; // 핸드폰 번호
//   final String gender; // 성별
//   final String birthdate; // 생년월일
//   final String nickname; // 닉네임
//   final String imageUrl; // 프로필사진
//   final bool receivePushNotifications; // 푸시 알림 수신 여부

//   UserProfile({
//     required this.id,
//     required this.username,
//     required this.phoneNumber,
//     required this.gender,
//     required this.birthdate,
//     required this.nickname,
//     required String this.imageUrl,
//     required this.receivePushNotifications,
//   });
// }

// List<UserProfile> dummyProfile = [
//   UserProfile(
//     id: '1',
//     username: '강승훈',
//     phoneNumber: '01086965185',
//     gender: "남",
//     birthdate: '1995-10-20',
//     nickname: '코리',
//     imageUrl: 'assets/image/toilet_paper.png',
//     receivePushNotifications: true,
//   ),
//   UserProfile(
//     id: '2',
//     username: '강승훈',
//     phoneNumber: '01086965185',
//     gender: "여",
//     birthdate: '1995-10-20',
//     nickname: '코리',
//     imageUrl: 'assets/image/toilet_paper.png',
//     receivePushNotifications: true,
//   ),
//   UserProfile(
//     id: '3',
//     username: '강승훈',
//     phoneNumber: '01086965185',
//     gender: "남",
//     birthdate: '1995-10-20',
//     nickname: '코리',
//     imageUrl: 'assets/image/toilet_paper.png',
//     receivePushNotifications: true,
//   ),
//   UserProfile(
//     id: '4',
//     username: '강승훈',
//     phoneNumber: '01086965185',
//     gender: "남",
//     birthdate: '1995-10-20',
//     nickname: '코리',
//     imageUrl: 'assets/image/toilet_paper.png',
//     receivePushNotifications: true,
//   ),
//   UserProfile(
//     id: '5',
//     username: '강승훈',
//     phoneNumber: '01086965185',
//     gender: "남",
//     birthdate: '1995-10-20',
//     nickname: '코리',
//     imageUrl: 'assets/image/toilet_paper.png',
//     receivePushNotifications: true,
//   ),
//   UserProfile(
//     id: '6',
//     username: '강승훈',
//     phoneNumber: '01086965185',
//     gender: "남",
//     birthdate: '1995-10-20',
//     nickname: '코리',
//     imageUrl: 'assets/image/toilet_paper.png',
//     receivePushNotifications: true,
//   ),
//   UserProfile(
//     id: '7',
//     username: '강승훈',
//     phoneNumber: '01086965185',
//     gender: "남",
//     birthdate: '1995-10-20',
//     nickname: '코리',
//     imageUrl: 'assets/image/toilet_paper.png',
//     receivePushNotifications: true,
//   ),
// ];

// class User {
//   final String imagePath;
//   final String name;
//   final String email;
//   final String about;
//   final bool isDarkMode;

//   const User({
//     required this.imagePath,
//     required this.name,
//     required this.email,
//     required this.about,
//     required this.isDarkMode,
//   });

//   User copy({
//     String? imagePath,
//     String? name,
//     String? email,
//     String? about,
//     bool? isDarkMode,
//   }) =>
//       User(
//         imagePath: imagePath ?? this.imagePath,
//         name: name ?? this.name,
//         email: email ?? this.email,
//         about: about ?? this.about,
//         isDarkMode: isDarkMode ?? this.isDarkMode,
//       );

//   static User fromJson(Map<String, dynamic> json) => User(
//         imagePath: json['imagePath'],
//         name: json['name'],
//         email: json['email'],
//         about: json['about'],
//         isDarkMode: json['isDarkMode'],
//       );

//   Map<String, dynamic> toJson() => {
//         'imagePath': imagePath,
//         'name': name,
//         'email': email,
//         'about': about,
//         'isDarkMode': isDarkMode,
//       };
// }

class User {
  final String id, name, email, password, imagePath, about;
  final bool isDarkMode;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.imagePath,
    required this.about,
    required this.isDarkMode,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'imagePath': imagePath,
        'about': about,
        'isDarkMode': isDarkMode,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        imagePath: json['imagePath'],
        about: json['about'],
        isDarkMode: json['isDarkMode'],
      );
}
