import 'package:flutter/material.dart';

import 'meeting.dart';

class MeetingCard extends StatelessWidget {
  final Meeting meeting;
  final Function() onTap;

  MeetingCard({
    required this.meeting,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: Image.asset(
          meeting.image, // 모임 이미지 경로
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        title: Text(meeting.name), // 모임명
        subtitle: Text(meeting.description), // 모임 소개
        trailing: Text('${meeting.max_member}명 가입'), // 가입자 수
      ),
      onTap: onTap, // onTap 함수 호출
    );
  }
}
