import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'components/dummy_product.dart';
import 'components/category_widget.dart';
import 'components/popular_products.dart';
import 'components/rec_products.dart';
import 'product_detail_page.dart';

class CommercePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SearchBar(),
        Divider(),
        ImageSlider(products: dummyProducts),
        Divider(),
        ProductCategories(),
        Divider(),
        RecommendedProducts(products: dummyProducts),
        Divider(),
        ImageSlider(products: dummyProducts),
        Divider(),
        PopularProducts(products: dummyProducts),
        Divider(),
        Footer(),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Material(
        elevation: 5.0, // optional, for a little shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search for products...',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(
                10.0), // optional, to adjust the textfield inside the material
          ),
          onChanged: (query) {
            // Handle the search query here.
          },
        ),
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  final List<Product> products;

  ImageSlider({required this.products});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: products.map((product) {
        return Builder(builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(color: Colors.grey),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ));
              },
              child: Image.asset(product.imageUrl, fit: BoxFit.cover),
            ),
          );
        });
      }).toList(),
      options: CarouselOptions(
        height: 200.0,
        viewportFraction: 1.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}

class ProductCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryWidget(
            iconData: Icons.filter_alt_off_outlined,
            categoryName: '전체',
          ),
          CategoryWidget(iconData: Icons.fastfood, categoryName: '식품'),
          CategoryWidget(iconData: Icons.kitchen, categoryName: '주방용품'),
          CategoryWidget(
            iconData: Icons.wheelchair_pickup_rounded,
            categoryName: '요양용품',
          ),
          CategoryWidget(
            iconData: Icons.screenshot_monitor_sharp,
            categoryName: '가전',
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // Your footer content here
        );
  }
}
