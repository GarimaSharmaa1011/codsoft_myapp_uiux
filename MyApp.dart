

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductListPage(),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Product 1",
      description: "This is a description of product 1.",
      price: 29.99,
      imageUrl: "https://via.placeholder.com/150",
    ),
    Product(
      name: "Product 2",
      description: "This is a description of product 2.",
      price: 49.99,
      imageUrl: "https://via.placeholder.com/150",
    ),
    Product(
      name: "Product 3",
      description: "This is a description of product 3.",
      price: 19.99,
      imageUrl: "https://via.placeholder.com/150",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Commerce Store"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          final product = products[index];
          return ProductItem(product);
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Image.network(product.imageUrl, fit: BoxFit.cover, height: 120, width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                   
                  },
                  child: const Text("Add to Cart"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
