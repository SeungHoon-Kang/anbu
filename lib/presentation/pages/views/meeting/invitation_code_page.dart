import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InvitationCodePage extends StatefulWidget {
  @override
  _InvitationCodePageState createState() => _InvitationCodePageState();
}

class _InvitationCodePageState extends State<InvitationCodePage> {
  TextEditingController codeController = TextEditingController();

  void _handleConfirm() {
    // 가상의 초대 코드 리스트
    List<String> inviteCodes = [
      '123',
      '456',
      '789',
      '012',
      '023',
      '034',
      '045',
      '056',
      '067',
      '078',
    ];

    // 사용자가 입력한 코드
    String enteredCode = codeController.text;

    // 초대 코드의 유효성 확인
    if (inviteCodes.contains(enteredCode)) {
      // 유효한 초대 코드일 경우, 사용자를 모임에 추가하는 로직을 수행합니다.
      // 예) API 호출을 통해 서버에 사용자를 모임에 추가 요청합니다.

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('You have joined the meeting.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            )
          ],
        ),
      );
    } else {
      // 유효하지 않은 초대 코드일 경우, 에러 메시지를 보여줍니다.
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('The entered code is not valid.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('초대 코드 입력'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '초대 코드를 입력하세요',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: codeController,
              decoration: InputDecoration(
                labelText: '초대 코드',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _handleConfirm,
              child: Text('확인'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }
}
