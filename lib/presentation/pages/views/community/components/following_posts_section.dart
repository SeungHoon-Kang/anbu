// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:page_transition/page_transition.dart';

// import '../post_detail_page.dart';

// class FollowingPostsSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         // 팔로잉 / 게시물 섹션
//         InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               PageTransition(
//                 child: CategoryPage(),
//                 type: PageTransitionType.rightToLeft,
//               ),
//             );
//           },
//           child: Container(
//             padding: EdgeInsets.symmetric(vertical: 30),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: const BorderRadius.all(Radius.circular(20)),
//             ),
//             margin: EdgeInsets.symmetric(horizontal: 45),
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   width: 10,
//                   margin: EdgeInsets.symmetric(horizontal: 0),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       PageTransition(
//                         child: CategoryPage(),
//                         type: PageTransitionType.rightToLeft,
//                       ),
//                     );
//                   },
//                   child: Text('팔로잉 / 게시물', style: TextStyle(fontSize: 20)),
//                 ),
//                 Container(
//                   width: 20,
//                   margin: EdgeInsets.symmetric(horizontal: 10),
//                   child: Icon(Icons.keyboard_arrow_right, size: 30),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: 10),
//         // CarouselSlider 추가
//         CarouselSlider(
//           items: [1, 2, 3, 4, 5].map((i) {
//             return Builder(builder: (BuildContext context) {
//               return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     PageTransition(
//                       child: CategoryPage(),
//                       type: PageTransitionType.rightToLeft,
//                     ),
//                   );
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(color: Colors.amber),
//                   width: MediaQuery.of(context).size.width,
//                   margin: EdgeInsets.symmetric(horizontal: 5.0),
//                   child: Center(
//                     child: Text('text $i', style: TextStyle(fontSize: 16.0)),
//                   ),
//                 ),
//               );
//             });
//           }).toList(),
//           options: CarouselOptions(
//             aspectRatio: 1.0, // 너비에 비례하도록 크기 지정
//             enableInfiniteScroll: false, // 무한 스크롤 비활성화
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FollowingPostsTestSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 기타 위젯들 추가

        // 팔로잉 / 게시물 테스트 섹션
        SizedBox(
          height: 200, // 스크롤 가능한 높이 조정
          child: CarouselSlider(
            items: [
              // 테스트용 게시물 아이템
            ],
            options: CarouselOptions(
              aspectRatio: 16 / 9, // 이미지 가로세로 비율 설정
              enableInfiniteScroll: true, // 무한 스크롤 활성화
              autoPlay: true, // 자동 스크롤 활성화
              autoPlayInterval: Duration(seconds: 3), // 자동 스크롤 간격
              autoPlayAnimationDuration:
                  Duration(milliseconds: 800), // 자동 스크롤 애니메이션 속도
              autoPlayCurve: Curves.fastOutSlowIn, // 자동 스크롤 애니메이션 곡선
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTestPostItem(int index) {
    // 테스트용 게시물 아이템을 생성하여 반환
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 이미지 부분
          Container(
            width: double.infinity,
            height: 150, // 이미지 높이 조절
            color: Colors.grey, // 이미지를 대체할 색 또는 이미지 사용
          ),
          SizedBox(height: 10), // 이미지와 텍스트 간격
          // 텍스트 부분
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '테스트 게시물 $index',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
