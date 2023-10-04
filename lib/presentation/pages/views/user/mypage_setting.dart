import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isPushNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text('푸시 알림'),
            trailing: Switch(
              value: isPushNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  isPushNotificationEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('문의하기'),
            onTap: () {
              // Navigate to Inquiry Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InquiryPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('회사 소개'),
            onTap: () {
              // Navigate to Company Info Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompanyInfoPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('이용약관 및 개인정보 처리방침'),
            onTap: () {
              // Navigate to Terms and Privacy Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TermsAndPrivacyPage(),
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('로그아웃'),
                    content: Text('정말로 로그아웃하시겠습니까?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('취소'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add logout logic here
                          Navigator.pop(context);
                        },
                        child: Text('확인'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('로그아웃'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('회원 탈퇴'),
                    content: Text('정말로 회원 탈퇴를 하시겠습니까?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('취소'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('확인'),
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('회원 탈퇴'),
          ),
        ],
      ),
    );
  }
}

class InquiryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('문의하기'),
      ),
      // Add Inquiry Page UI Here
    );
  }
}

class CompanyInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회사 소개'),
      ),
      // Add Company Info Page UI Here
    );
  }
}

class TermsAndPrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이용약관 및 개인정보 처리방침'),
      ),
      // Add Terms and Privacy Page UI Here
    );
  }
}
