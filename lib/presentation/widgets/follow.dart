import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/views/user/mypage.dart';

class FollowingPostsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              children: <Widget>[
                Container(
                  width: 10,
                  margin: EdgeInsets.symmetric(horizontal: 0),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: MyInfoMainPage(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  child: Text('팔로잉 / 게시물', style: TextStyle(fontSize: 20)),
                ),
                Container(
                  width: 20,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.keyboard_arrow_right, size: 30),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // Add your TextButton widgets and other items here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
