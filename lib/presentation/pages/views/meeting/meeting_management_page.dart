import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/cubit/manage_meeting_cubit.dart';
import 'component/meeting.dart';
import 'component/meeting_card.dart';
import 'meeting_detail_page.dart';

class MeetingManagementPage extends StatefulWidget {
  @override
  _MeetingManagementPageState createState() => _MeetingManagementPageState();
}

class _MeetingManagementPageState extends State<MeetingManagementPage> {
  int _currentTab = 0; // Define _currentTab here
  List<Meeting> filteredMeetings = []; // 필터링된 모임 목록을 저장할 리스트

  void _changeTab(int index) {
    setState(() {
      _currentTab = index;
      // '내가 생성한 모임' 또는 '내가 가입한 모임' 버튼을 누를 때마다 필터링된 모임 목록을 업데이트
      if (index == 0) {
        // 내가 생성한 모임 필터링 (예시: 모임의 creatorID를 확인하여 필터링)
        final allMeetings = context.read<MeetingCubit>().state;
        filteredMeetings = allMeetings.where((meeting) {
          return meeting.creatorID == '내 사용자 ID'; // 조건을 변경하세요.
        }).toList();
      } else {
        // 내가 가입한 모임 필터링 (예시: 내 사용자 ID가 가입한 모임을 필터링)
        final allMeetings = context.read<MeetingCubit>().state;
        filteredMeetings = allMeetings.where((meeting) {
          return meeting.member_id.contains('내 사용자 ID'); // 조건을 변경하세요.
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('모임 관리 페이지'),
      ),
      body: BlocProvider(
        create: (context) => MeetingCubit(), // MeetingCubit을 제공
        child: Column(
          children: [
            // Tab Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<MeetingCubit>().updateJoinedMeetings();
                    _changeTab(0);
                  },
                  style: _currentTab == 0
                      ? ElevatedButton.styleFrom(primary: Colors.blue)
                      : null,
                  child: Text('내가 생성한 모임'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<MeetingCubit>().updateMyMeetings();
                    _changeTab(1);
                  },
                  style: _currentTab == 1
                      ? ElevatedButton.styleFrom(primary: Colors.blue)
                      : null,
                  child: Text('내가 가입한 모임'),
                ),
              ],
            ),

            // Meeting List
            Expanded(
              child: BlocBuilder<MeetingCubit, List<Meeting>>(
                builder: (context, meetings) {
                  // filteredMeetings를 사용하여 필터링된 모임을 표시
                  final displayedMeetings =
                      filteredMeetings.isNotEmpty ? filteredMeetings : meetings;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      final meeting = displayedMeetings[index];

                      return MeetingCard(
                        meeting: meeting,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MeetingDetailPage(
                                meeting: meeting,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: displayedMeetings.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
