import 'package:flutter/material.dart';

// import '../user/model/user.dart';

class PostDetailPage extends StatefulWidget {
  final String postTitle;
  final String postContent;

  // 생성자에서 게시판 글의 제목과 내용을 받습니다.
  PostDetailPage({
    required this.postTitle,
    required this.postContent,
  });

  get userProfile => null;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시판 글 상세보기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              // 사용자 프로필 사진
              widget.userProfile.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            // 게시판 글 제목
            Text(
              widget.postTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // 게시판 글 내용
            Text(
              widget.postContent,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
