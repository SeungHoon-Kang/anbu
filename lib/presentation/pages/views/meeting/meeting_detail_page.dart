import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'component/meeting.dart';

class MeetingDetailPage extends StatefulWidget {
  final Meeting meeting;
  MeetingDetailPage({required this.meeting, Key? key}) : super(key: key);

  @override
  _MeetingDetailPageState createState() => _MeetingDetailPageState();
}

class _MeetingDetailPageState extends State<MeetingDetailPage> {
  bool isUserJoined = false;

  @override
  void initState() {
    super.initState();
    isUserJoined = widget.meeting.isJoined;
  }

  void joinMeeting() {
    setState(() {
      isUserJoined = true;
    });
  }

  void leaveMeeting() {
    setState(() {
      isUserJoined = false;
    });
  }

  Future<void> copyInviteCodeToClipboard(
      BuildContext context, String inviteCode) async {
    try {
      await Clipboard.setData(ClipboardData(text: inviteCode));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invite code copied to clipboard'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to copy invite code'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.meeting.isPrivate && !isUserJoined) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.meeting.name),
        ),
        body: Center(
          child: Text('이 모임은 비공개 모임이며, 회원만 접근할 수 있습니다.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meeting.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSlider(
              items: widget.meeting.representativePhotos.map((photoUrl) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(photoUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 200.0,
                enableInfiniteScroll: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '모임 정보',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.meeting.description,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '멤버 목록',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    children: widget.meeting.memberPhotos.map((photoUrl) {
                      return CircleAvatar(
                        backgroundImage: NetworkImage(photoUrl),
                        radius: 30.0,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              if (isUserJoined) {
                leaveMeeting();
              } else {
                joinMeeting();
              }
            },
            child: Text(isUserJoined ? '탈퇴하기' : '가입하기'),
          ),
          ElevatedButton(
            onPressed: () {
              copyInviteCodeToClipboard(context, 'YourInviteCodeHere');
            },
            child: Text('Copy Invite Code'),
          ),
        ],
      ),
    );
  }
}
