import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../meeting/meeting_main_page.dart';

class MeetingBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: MeetingPage(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  child: Text('모임 생성 / 가입', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
          Container(
            width: 20,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.keyboard_arrow_right, size: 30),
          ),
        ],
      ),
    );
  }
}
