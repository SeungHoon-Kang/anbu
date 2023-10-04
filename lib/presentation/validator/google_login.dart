// // facebook_login.dart

// import 'package:flutter/material.dart';

// class FacebookLoginButton extends StatelessWidget {
//   final Function(FacebookLoginStatus) onLoginResult;

//   FacebookLoginButton({required this.onLoginResult});

//   @override
//   Widget build(BuildContext context) {
//     final FacebookLogin _facebookLogin = FacebookLogin();

//     return ElevatedButton(
//       onPressed: () async {
//         final result = await _facebookLogin.logIn(['email']);

//         onLoginResult(result.status);
//       },
//       child: Text('Login with Facebook'),
//     );
//   }
// }
