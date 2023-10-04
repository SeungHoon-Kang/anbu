import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  final IconData iconData;
  final String categoryName;
  final VoidCallback? onTap;

  CategoryWidget({
    required this.iconData,
    required this.categoryName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: 100,
        child: Column(
          children: <Widget>[
            CircleAvatar(
              child: Icon(
                iconData,
                size: 20,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              radius: 30,
            ),
            SizedBox(height: 6), // Adjust the height to provide more space
            Text(
              categoryName,
              style: GoogleFonts.poppins(
                fontSize: 12, // Adjust the font size to ensure text fits
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem {
  final IconData iconData;
  final String categoryName;
  final VoidCallback? onTap;

  CategoryItem({
    required this.iconData,
    required this.categoryName,
    this.onTap,
  });
}

class CategorySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<CategoryItem> categories = [
      CategoryItem(
        iconData: Icons.fastfood,
        categoryName: '식품',
        onTap: () {
          print('식품 카테고리 클릭');
          // 여기에 카테고리별 로직 추가
        },
      ),
      CategoryItem(
        iconData: Icons.kitchen,
        categoryName: '주방용품',
        onTap: () {
          print('주방용품 카테고리 클릭');
        },
      ),
      // 다른 카테고리들도 위와 같이 추가...
    ];

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryWidget(
          iconData: category.iconData,
          categoryName: category.categoryName,
          onTap: category.onTap,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 10);
      },
      itemCount: categories.length,
    );
  }
}
