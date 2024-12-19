import 'package:flutter/material.dart';
import 'package:interview_project/model/product_model.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = List.generate(
    10000,
    (index) => Product(
      id: index,
      name: 'Product $index',
      title: 'Title $index',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.title),
            onTap: () => _showProductDetail(context, product),
          );
        },
      ),
    );
  }

  void _showProductDetail(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${product.id}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Name: ${product.name}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Title: ${product.title}', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        );
      },
    );
  }
}
