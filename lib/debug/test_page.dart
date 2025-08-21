import 'package:flutter/material.dart';

import '../data/data_source/product_data_source.dart';

class TestDataPage extends StatefulWidget {
  const TestDataPage({super.key});

  @override
  State<TestDataPage> createState() => _TestDataPageState();
}

class _TestDataPageState extends State<TestDataPage> {
  bool _isLoading = true;
  String _result = '';

  @override
  void initState() {
    super.initState();
    _testProductDataLoading();
  }

  Future<void> _testProductDataLoading() async {
    try {
      print('🔄 Loading product data...');

      final dataSource = ProductDataSource();
      final products = await dataSource.loadProductData();

      String output = '✅ Successfully loaded ${products.length} products\n';
      output += '📋 Product Details:\n';
      output += '${'=' * 50}\n';

      for (int i = 0; i < products.length; i++) {
        final product = products[i];
        output += 'Product ${i + 1}:\n';
        output += '  ID: ${product.id}\n';
        output += '  Name: ${product.name}\n';
        output += '  Image: ${product.imageFileName}\n';
        output += '  Description: ${product.description}\n';
        output += '  Seller: ${product.seller}\n';
        output += '  Price: ${product.price}\n';
        output += '  Address: ${product.address}\n';
        output += '  Like Count: ${product.likeCount}\n';
        output += '  Message Count: ${product.messageCount}\n';
        output += '${'-' * 30}\n';
      }

      print(output);

      setState(() {
        _result = output;
        _isLoading = false;
      });
    } catch (error) {
      final errorMsg = '❌ Error loading products: $error';
      print(errorMsg);
      setState(() {
        _result = errorMsg;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Test')),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      _result,
                      style: const TextStyle(fontFamily: 'monospace'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Center(),
                          ),
                        );
                      },
                      child: const Text('Go to App'),
                    ),
                  ],
                ),
              ),
    );
  }
}
