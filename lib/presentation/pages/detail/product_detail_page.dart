import 'package:apple_market/presentation/pages/detail/widgets/product_bottom_section.dart';
import 'package:apple_market/presentation/pages/detail/widgets/product_description.dart';
import 'package:apple_market/presentation/pages/detail/widgets/seller_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/constants/app_constants.dart';
import '../../../domain/entity/product.dart';
import 'product_detail_view_model.dart';

class ProductDetailPage extends ConsumerWidget {
  const ProductDetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentProduct = ref.watch(productDetailViewModelProvider(product));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(AppConstants.detailPageTitle),
      ),
      body: _buildPageContent(context, currentProduct),
      bottomNavigationBar: ProductBottomSection(
        productId: currentProduct.id,
        isLiked: currentProduct.isLiked,
        price: currentProduct.price,
        onLikeToggle:
            ref
                .read(productDetailViewModelProvider(product).notifier)
                .handleLikeToggle,
      ),
    );
  }

  Widget _buildPageContent(BuildContext context, Product product) {
    return SizedBox.expand(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildProductHeaderImage(
                    context,
                    imageFileName: product.imageFileName,
                  ),
                  SellerInformation(
                    sellerName: product.seller,
                    location: product.address,
                  ),
                  ProductDescription(
                    title: product.name,
                    content: product.description,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductHeaderImage(
    BuildContext context, {
    required String imageFileName,
  }) {
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Image.asset(
        '${AppConstants.imageBasePath}$imageFileName.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
