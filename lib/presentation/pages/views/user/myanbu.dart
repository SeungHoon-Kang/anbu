import 'package:flutter/material.dart';

import '../community/components/meeting_banner.dart';
import 'model/user.dart';
import 'my_anbu/edit_profile_page.dart';

class MyAnbu extends StatefulWidget {
  final String postTitle;
  final String postContent;

  // 생성자에서 게시판 글의 제목과 내용을 받습니다.
  MyAnbu({
    required this.postTitle,
    required this.postContent,
  });

  get userProfile => null;

  @override
  State<MyAnbu> createState() => _MyAnbuState();
}

class _MyAnbuState extends State<MyAnbu> {
  bool userHasJoinedGroups = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('모임 개설/가입해주세요'),
              if (!userHasJoinedGroups)
                MeetingBanner()
              else
                Container(
                  height: 200, // Specify the height of the slider
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5, // Replace with the number of groups
                    itemBuilder: (context, index) {
                      return Card(
                        // Replace with a widget that displays group information
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Group $index'),
                        ),
                      );
                    },
                  ),
                ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/image/sample_profile_img.png'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('게시글 0'),
                      Text('팔로워 0'),
                      Text('팔로잉 0'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text('사용자 닉네임'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('한 줄 소개'),
                  TextButton(
                    onPressed: () {
                      // Navigate to profile edit page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileEditPage(),
                        ),
                      );
                    },
                    child: Text('프로필 수정'),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text('커뮤니티 게시글'),
              //     TextButton(
              //       onPressed: () {
              //         // Navigate to a page with all community posts
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => CommunityPage()),
              //         );
              //       },
              //       child: Row(
              //         children: [
              //           Text('See All'),
              //           Icon(Icons.arrow_forward_ios, size: 16),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // Container(
              //   height: 200,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 5,
              //     itemBuilder: (context, index) {
              //       return Card(
              //         child: Padding(
              //           padding: EdgeInsets.all(8),
              //           child: Text('Post $index'),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('팔로잉 게시글'),
                  TextButton(
                    onPressed: () {
                      // Navigate to a page with all following posts
                    },
                    child: Row(
                      children: [
                        Text('See All'),
                        Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Following Post $index'),
                      ),
                    );
                  },
                ),
              ),

              // Following Posts Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('팔로잉 게시글'),
                  TextButton(
                    onPressed: () {
                      // Navigate to a page with all following posts
                    },
                    child: Row(
                      children: [
                        Text('See All'),
                        Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Following Post $index'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
