import 'package:flutter/material.dart';

class ProductTabs extends StatefulWidget {
  @override
  _ProductTabsState createState() => _ProductTabsState();
}

class _ProductTabsState extends State<ProductTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: '상세 정보'),
            Tab(text: '리뷰'),
            Tab(text: '문의하기'),
            Tab(text: '교환/반품'),
          ],
        ),
        Container(
          height: 200,
          child: TabBarView(
            controller: _tabController,
            children: [
              Container(child: Text('제품 상세정보')),
              Container(child: Text('리뷰')),
              Container(child: Text('문의하기')),
              Container(child: Text('교환 / 반품')),
            ],
          ),
        ),
      ],
    );
  }
}
