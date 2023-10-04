import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../widgets/follow.dart';
import '../post/post_detail_page.dart';
import '../user/model/user.dart';
import 'components/meeting_banner.dart';
import 'components/post_card.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({
    Key? key,
  });

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  String searchQuery = ''; // 검색어를 저장할 변수
  // late final List<UserProfile> userprofile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 모임 생성 / 가입 섹션
          MeetingBanner(),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '검색어를 입력하세요',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  searchQuery = text;
                });
              },
            ),
          ),

          // 검색 결과 섹션
          if (searchQuery.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '검색 결과',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return PostCard(
                  title: '게시판 글 ${index + 1}',
                  postType: PostType.community,
                  onTap: () {
                    // 게시판 글 상세 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailPage(
                          // 게시판 글의 제목과 내용을 전달
                          postTitle: '게시판 글 ${index + 1} 제목',
                          postContent: '게시판 글 ${index + 1}의 내용입니다.',
                        ),
                      ),
                    );
                  },
                );
              },
              itemCount: 5,
            ),
          ),

          // 팔로잉 / 게시물 섹션
          FollowingPostsSection(),
        ],
      ),
    );
  }
}
