import 'package:flutter/material.dart';
import 'myanbu.dart';
import 'myshopping.dart'; // Import the 'MyShoppingPage' page widget
import 'mypage_setting.dart'; // Import the 'SettingsPage' page widget

class MyInfoMainPage extends StatefulWidget {
  const MyInfoMainPage({Key? key}) : super(key: key);

  @override
  _MyInfoMainPageState createState() => _MyInfoMainPageState();
}

class _MyInfoMainPageState extends State<MyInfoMainPage> {
  bool userHasJoinedGroups = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('내정보 메인 페이지'),
          bottom: TabBar(
            tabs: [
              Tab(text: '마이 안부'),
              Tab(text: '마이 쇼핑'),
              Tab(text: '설정'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyAnbu(
              postTitle: 'Post Title Example',
              postContent: 'Post Content Example',
            ),
            MyShoppingPage(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
