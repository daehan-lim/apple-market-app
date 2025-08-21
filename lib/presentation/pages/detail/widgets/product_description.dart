import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String title;
  final String content;

  const ProductDescription({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 17),
          Text(content, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
