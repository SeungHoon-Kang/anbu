import 'package:flutter/material.dart';

// 아이콘을 나타내기 위한 열거형 (모임 또는 커뮤니티)
enum PostType { community, gathering }

class PostCard extends StatelessWidget {
  final String title;
  final PostType postType;
  final VoidCallback? onTap; // 'onTap' 파라미터 추가

  const PostCard({
    Key? key,
    required this.title,
    required this.postType,
    this.onTap, // 'onTap' 파라미터를 옵션으로 받도록 변경
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // InkWell을 통해 터치 이벤트를 처리
      child: Card(
        child: ListTile(
          leading: postType == PostType.community
              ? Icon(Icons.group, size: 40.0) // 커뮤니티 아이콘
              : Icon(Icons.event, size: 40.0), // 모임 아이콘
          title: Text(title),
        ),
      ),
    );
  }
}
