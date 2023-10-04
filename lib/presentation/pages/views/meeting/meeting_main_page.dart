import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'component/meeting_card.dart';
import 'component/meeting_dummy_data.dart';
import 'invitation_code_page.dart';
import 'meeting_create_page.dart';
import 'meeting_detail_page.dart';
import 'meeting_management_page.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key? key});

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  String searchQuery = ''; // 검색어를 저장할 변수

  // 다이얼로그 모달을 열기 위한 GlobalKey
  final GlobalKey<FormState> _dialogKey = GlobalKey<FormState>();

  // 다이얼로그 모달 열기 함수
  void _openInviteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('선택하세요'), // 다이얼로그 제목
          content: Column(
            mainAxisSize: MainAxisSize.min, // 컨텐츠 크기를 최소화
            children: [
              // "내 모임 관리" 옵션
              ListTile(
                title: Text('내 모임 관리'),
                onTap: () {
                  Navigator.of(context).pop(); // 다이얼로그 닫기
                  // "내 모임 관리" 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MeetingManagementPage(),
                    ),
                  );
                },
              ),
              // "초대코드 입력" 옵션
              ListTile(
                title: Text('초대코드 입력'),
                onTap: () {
                  Navigator.of(context).pop(); // 다이얼로그 닫기
                  // "초대코드 입력" 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InvitationCodePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              _openInviteDialog();
            },
          ),
        ],
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CarouselSlider(
            items: dummyMeetings.map((meeting) {
              return MeetingCard(
                meeting: meeting,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MeetingDetailPage(meeting: meeting),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              aspectRatio: 2.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),

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
          // 검색 결과 목록
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                if (index < dummyMeetings.length) {
                  return MeetingCard(
                    meeting: dummyMeetings[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MeetingDetailPage(meeting: dummyMeetings[index]),
                        ),
                      );
                    },
                  );
                } else {
                  return null;
                }
              },
              itemCount: dummyMeetings.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MeetingCreatePage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
