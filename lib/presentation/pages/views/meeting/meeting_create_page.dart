import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'component/meeting.dart';
import 'component/meeting_dummy_data.dart';
import 'meeting_management_page.dart';

class MeetingCreatePage extends StatefulWidget {
  MeetingCreatePage({Key? key}) : super(key: key);

  @override
  _MeetingCreatePageState createState() => _MeetingCreatePageState();
}

class _MeetingCreatePageState extends State<MeetingCreatePage> {
  String? selectedLocation = null;
  int maxMembers = 10;
  String meetingImage = '';
  TextEditingController meetingNameController = TextEditingController();
  TextEditingController meetingDescriptionController = TextEditingController();
  bool isPrivate = false; // 비공개 여부를 저장하는 변수를 추가합니다.

  File? selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    } else {
      // 이미지를 선택하지 않은 경우 기본 이미지 파일을 설정하거나 다른 처리를 수행
    }
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('모임 생성 확인'),
          content: SingleChildScrollView(
            child: ListBody(children: <Widget>[Text('해당 모임을 만드시겠습니까?')]),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                String meetingName = meetingNameController.text;
                String meetingDescription = meetingDescriptionController.text;

                Navigator.of(context).pop(); // 다이얼로그 닫기

                // 모임 생성이 확인된 후, 원하는 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MeetingManagementPage(), // 이동하고 싶은 페이지로 변경
                  ),
                );
              },
              child: Text('예'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('아니오'),
            ),
          ],
        );
      },
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('모임 생성'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '새로운 모임 생성',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),

            // 지역 선택 드롭다운
            // DropdownButtonFormField 수정
            DropdownButtonFormField<String>(
              items: ['지역 A', '지역 B', '지역 C']
                  .map((location) =>
                      DropdownMenuItem(value: location, child: Text(location)))
                  .toList(),
              value: selectedLocation, // 초기값을 설정
              onChanged: (value) {
                setState(() {
                  selectedLocation =
                      value; // 값을 변경할 때 DropdownMenuItem에 정의된 값 중 하나로 설정
                });
              },
              decoration: InputDecoration(
                labelText: '지역 선택',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // 모임 가입 정원 선택
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('모임 가입 정원'),
                DropdownButton<int>(
                  items: [10, 20, 30, 40, 50]
                      .map((members) => DropdownMenuItem(
                            value: members,
                            child: Text('$members 명'),
                          ))
                      .toList(),
                  value: maxMembers,
                  onChanged: (value) {
                    setState(() {
                      maxMembers = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('모임 대표 사진 선택'),
                SizedBox(height: 8.0),
                GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.5)),
                      ),
                      width: 120.0,
                      height: 120.0,
                      child: selectedImage == null
                          ? Icon(Icons.add, size: 48.0)
                          : Image.file(selectedImage!),
                    ),
                    onTap: _pickImage),
              ],
            ),

            // 모임 이름 입력
            TextFormField(
              controller: meetingNameController,
              decoration: InputDecoration(
                labelText: '모임 이름',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // 모임 소개글 입력
            TextFormField(
              controller: meetingDescriptionController,
              decoration: InputDecoration(
                labelText: '모임 소개',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),

            // "개시하기" 버튼
            ElevatedButton(
              onPressed: () {
                // 사용자가 입력한 정보로 Meeting 객체 생성
                Meeting newMeeting = Meeting(
                  id: dummyMeetings.length + 1,
                  name: meetingNameController.text,
                  description: meetingDescriptionController.text,
                  image: '',
                  member_id: ["user1"],
                  max_member: maxMembers,
                  isJoined: false,
                  isPrivate: false,
                  representativePhotos: [],
                  memberPhotos: [],
                  creatorID: "user1",
                  inviteCode: isPrivate
                      ? "SOME_GENERATED_CODE"
                      : null, // 비공개 모임인 경우에만 초대코드 제공
                );

                // 생성한 Meeting 객체를 dummyMeetings 리스트에 추가
                dummyMeetings.add(newMeeting);

                // 모임 생성 확인 다이얼로그 표시
                _showConfirmationDialog();
              },
              child: Text('개시하기'),
            ),
          ],
        ),
      ),
    );
  }
}
