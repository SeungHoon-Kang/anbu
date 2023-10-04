import 'package:flutter/material.dart';

import 'order_status_page.dart';
import 'utils/order_item.dart';

class MyShoppingPage extends StatelessWidget {
  final String title = '나의 칭호는 \'칭호\' 입니다.';
  final int points = 100;

  List<OrderItem> orderItems = [
    OrderItem(
      imageUrl: 'https://example.com/image1.jpg',
      productName: 'Product 1',
      price: 29.99,
      quantity: 1,
    ),
    OrderItem(
      imageUrl: 'https://example.com/image2.jpg',
      productName: 'Product 2',
      price: 19.99,
      quantity: 2,
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Shopping')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Change Title Button
              Row(
                children: [
                  Expanded(child: Text(title)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/changeTitle');
                    },
                    child: Text('칭호 변경'),
                  ),
                ],
              ),
              // Points Section
              Text('포인트 $points P'),
              // Content Box
              Container(
                color: Colors.grey[200],
                height: 100,
                child: Center(child: Text('Content Box')),
              ),
              // Delivery Info Section
              SizedBox(height: 20),
              Text('배송지 관련'),
              Divider(),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Current Delivery Info'),
                    TextButton(
                      onPressed: () {
                        // Navigate to Change Delivery Info Page
                      },
                      child: Text('기본 배송지 변경 >'),
                    ),
                  ],
                ),
              ),
              // Stats Section
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Column(children: [Text('100'), Text('구매후기')]),
                    onTap: () {
                      Navigator.pushNamed(context, '/reviewPage');
                    },
                  ),
                  InkWell(
                    child: Column(children: [Text('50'), Text('찜목록')]),
                    onTap: () {
                      Navigator.pushNamed(context, '/favoritesPage');
                    },
                  ),
                  InkWell(
                    child: Column(children: [Text('20'), Text('최근 본 상품')]),
                    onTap: () {
                      Navigator.pushNamed(context, '/recentlyViewed');
                    },
                  ),
                ],
              ),
              // Order Status Section
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Navigate to Detailed Order Status Page
                },
                child: Text('나의 주문처리 현황 (최근 3개월 기준)'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          orderStatus('입금전 주문', 5, context),
                          orderStatus('배송준비중인 주문', 3, context),
                          orderStatus('배송중인 주문', 7, context),
                          orderStatus('배송완료된 주문', 10, context),
                          orderStatus('취소된 주문', 2, context),
                          orderStatus('교환된 주문', 1, context),
                          orderStatus('반품된 주문', 4, context),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderStatus(String status, int count, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyOrderStatusPage(
              orderStatus: 'Processing',
              orderItems: orderItems,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Text('$count'),
          SizedBox(height: 4),
          Text(status),
        ],
      ),
    );
  }
}

class ChangeTitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Title')),
      body: Center(child: Text('Change Title Page')),
    );
  }
}

class ChangeDeliveryInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Delivery Info')),
      body: Center(child: Text('Change Delivery Info Page')),
    );
  }
}

class OrderStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Status')),
      body: Center(child: Text('Order Status Page')),
    );
  }
}

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Review')),
      body: Center(child: Text('Review Page')),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: Center(child: Text('Favorites Page')),
    );
  }
}

class RecentlyViewedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recently Viewed')),
      body: Center(child: Text('Recently Viewed Page')),
    );
  }
}
