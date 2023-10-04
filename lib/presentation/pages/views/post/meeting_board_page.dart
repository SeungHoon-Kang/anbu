// MeetingBoardPage
import 'dart:math';

import 'package:flutter/material.dart';

import '../meeting/component/meeting.dart';
import '../meeting/component/meeting_detail_content.dart';

class MeetingBoardPage extends StatefulWidget {
  final Meeting meeting;
  MeetingBoardPage({required this.meeting, Key? key}) : super(key: key);

  @override
  _MeetingBoardPage createState() => _MeetingBoardPage();
}

class _MeetingBoardPage extends State<MeetingBoardPage> {
  double get randHeight => Random().nextInt(100).toDouble();

  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: "홈"),
                  Tab(text: "게시판"),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            MeetingDetailContent(
                meeting: widget.meeting), // Replace with your Meeting object

            Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 40,
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('게시판'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
