import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../commerce_page/commerce_page.dart';
import '../sign_up.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  Future<void> _handleGoogleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        print('구글 로그인 성공: ${googleUser.displayName}');
        _navigateToMainScreen(); // 로그인 성공 시 메인 화면으로 이동
      } else {
        print('구글 로그인 실패');
      }
    } catch (e) {
      print('구글 로그인 에러: $e');
    }
  }

  void _navigateToMainScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CommercePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // 아이디(전화번호) 입력 필드
        TextFormField(
          decoration: InputDecoration(
            hintText: '아이디(전화번호) 입력',
            prefixIcon: const Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          maxLines: 1,
          validator: (value) => EmailValidator.validate(value!)
              ? null
              : "Please enter a valid email",
        ),
        const SizedBox(height: 20),

        // 비밀번호 입력 필드
        TextFormField(
            decoration: InputDecoration(
                hintText: '비밀번호 입력',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)))),
            obscureText: true,
            maxLines: 1,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            }),

        // 자동로그인 체크박스
        CheckboxListTile(
          title: const Text("자동로그인"),
          contentPadding: EdgeInsets.zero,
          value: rememberValue,
          activeColor: Theme.of(context).colorScheme.primary,
          onChanged: (newValue) {
            setState(() {
              rememberValue = newValue!;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('비밀번호 찾기'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
            ),
            TextButton(
              child: const Text('회원가입 하기'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
            ),
          ],
        ),
        // 로그인 버튼
        ElevatedButton(
          onPressed: () {
            // Attempt to log in after verifying the form
            if (_formKey.currentState!.validate()) {
              // login logic
              _navigateToMainScreen();
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5.0,
            backgroundColor: Colors.orange,
            padding: const EdgeInsets.symmetric(
              vertical: 15, // Increased vertical padding to match input fields
              horizontal:
                  15, // Increased horizontal padding to match input fields
            ),
          ),
          child: Row(
            // Use Row to display content horizontally
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the content horizontally
            children: [
              Text(
                '로그인',
                style: TextStyle(
                  color: HexColor("#FF6A3D"),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),
      ]),
    );
  }
}
