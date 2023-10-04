import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isAgreed = false; // 체크박스 동의 여부를 관리하는 변수
  // Form fields
  String _email = '';
  String _nickname = '';
  String _username = '';
  String _password = '';

  // 필수 동의 항목 목록
  List<String> _mandatoryAgreements = [
    '이용약관',
    '개인정보 처리방침',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '이메일을 입력하세요.';
              }
              // 이메일 형식 검증 로직을 추가할 수도 있습니다.
              return null;
            },
            decoration: InputDecoration(
              hintText: '이메일',
              prefixIcon: const Icon(Icons.email),
            ),
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '닉네임을 입력하세요.';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: '닉네임',
              prefixIcon: const Icon(Icons.person),
            ),
            onChanged: (value) {
              setState(() {
                _nickname = value;
              });
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '아이디를 입력하세요.';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: '아이디',
              prefixIcon: const Icon(Icons.account_circle),
            ),
            onChanged: (value) {
              setState(() {
                _username = value;
              });
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '비밀번호를 입력하세요.';
              }
              // 비밀번호 강도 검증 로직을 추가할 수도 있습니다.
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              hintText: '비밀번호',
              prefixIcon: const Icon(Icons.lock),
            ),
            onChanged: (value) {
              setState(() {
                _password = value;
              });
            },
          ),
          const SizedBox(height: 15),

          // 약관 동의 체크박스
          Row(
            children: [
              Checkbox(
                value: _isAgreed,
                onChanged: (newValue) {
                  setState(() {
                    _isAgreed = newValue ?? false;
                  });
                },
              ),
              Text('모두 동의합니다.'),
            ],
          ),

          // 필수 동의 항목 목록을 생성
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _mandatoryAgreements.map((agreement) {
              return Row(
                children: [
                  Checkbox(
                    value: _isAgreed,
                    onChanged: (newValue) {
                      setState(() {
                        _isAgreed = newValue ?? false;
                      });
                    },
                  ),
                  Text('$agreement 동의'),
                ],
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate() && _isAgreed) {
                final user = {
                  'email': _email,
                  'nickname': _nickname,
                  'username': _username,
                  'password': _password,
                };

                // final dbHelper = DatabaseHelper.instance;
                // final userId = await dbHelper.insertUser(user);

                // if (userId != -1) {
                //   // 회원가입 성공
                //   print('회원가입 성공, 사용자 ID: $userId');
                // } else {
                //   // 회원가입 실패
                //   print('회원가입 실패');
                // }
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              primary: _isAgreed ? Colors.orange : Colors.grey,
            ),
            child: const Text(
              '회원가입',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
