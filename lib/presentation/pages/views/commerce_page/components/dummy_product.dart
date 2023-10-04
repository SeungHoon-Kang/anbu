import 'package:intl/intl.dart';

class Product {
  final String productId;
  final String brandName;
  final String title;
  final double price;
  final double starRating;
  final String imageUrl;
  final String type; // type 필드 추가

  Product({
    required this.productId,
    required this.brandName,
    required this.title,
    required this.price,
    required this.starRating,
    required this.imageUrl,
    required this.type, // 생성자에 type 추가
  });

  String get name => title;
}

List<Product> dummyProducts = [
  Product(
    productId: '1',
    brandName: 'Nike',
    title: "Men's Running Shoes",
    price: 89.99,
    starRating: 4.5,
    imageUrl: 'assets/image/toilet_paper.png',
    type: '식품',
  ),
  Product(
    productId: '2',
    brandName: 'Adidas',
    title: "Women's Sports Leggings",
    price: 29.99,
    starRating: 4.2,
    imageUrl: 'assets/image/toilet_paper2.png',
    type: '가전',
  ),
  Product(
    productId: '3',
    brandName: 'Apple',
    title: 'iPhone 13 Pro',
    price: 999.99,
    starRating: 4.9,
    imageUrl: 'assets/image/hagis_pantie.png',
    type: '요양용품',
  ),
  Product(
    productId: '4',
    brandName: 'Samsung',
    title: 'Galaxy Watch 4',
    price: 199.99,
    starRating: 4.7,
    imageUrl: 'assets/image/chair.png',
    type: '식품',
  ),
  Product(
    productId: '5',
    brandName: 'Sony',
    title: 'Noise-Canceling Headphones',
    price: 149.99,
    starRating: 4.6,
    imageUrl: 'assets/image/hagis_pantie.png',
    type: '가전',
  ),
  Product(
    productId: '6',
    brandName: 'Canon',
    title: 'EOS Rebel T7i DSLR Camera',
    price: 599.99,
    starRating: 4.8,
    imageUrl: 'assets/image/chair.png',
    type: '요양용품',
  ),
  Product(
    productId: '7',
    brandName: 'Samsung',
    title: '65-Inch 4K QLED TV',
    price: 1299.99,
    starRating: 4.7,
    imageUrl: 'assets/image/toilet_paper.png',
    type: '주방용품',
  ),
  Product(
    productId: '8',
    brandName: 'Logitech',
    title: 'Wireless Gaming Mouse',
    price: 49.99,
    starRating: 4.4,
    imageUrl: 'assets/image/toilet_paper2.png',
    type: '주방용품',
  ),
  Product(
    productId: '9',
    brandName: 'Bose',
    title: 'Wireless Bluetooth Speaker',
    price: 99.99,
    starRating: 4.7,
    imageUrl: 'assets/image/toilet_paper.png',
    type: '요양용품',
  ),
  Product(
    productId: '10',
    brandName: 'KitchenAid',
    title: 'Stand Mixer',
    price: 199.99,
    starRating: 4.9,
    imageUrl: 'assets/image/toilet_paper2.png',
    type: '가전',
  ),
];
