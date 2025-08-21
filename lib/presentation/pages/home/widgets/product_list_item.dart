import 'package:apple_market/core/utils/dialog_util.dart';
import 'package:apple_market/core/utils/number_formatter.dart';
import 'package:apple_market/presentation/pages/home/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/app_colors.dart';
import '../../../../app/constants/app_constants.dart';
import '../../../../domain/entity/product.dart';
import '../../detail/product_detail_page.dart';

class ProductListItem extends ConsumerWidget {
  final Product product;

  const ProductListItem({super.key, required this.product});

  Future<void> _handleLongPress(BuildContext context, WidgetRef ref) async {
    final shouldDelete = await DialogUtil.showRemovalConfirmation(context);
    if (shouldDelete == true) {
      ref.read(homeViewModelProvider.notifier).removeProduct(product.id);
    }
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _navigateToDetail(context),
      onLongPress: () => _handleLongPress(context, ref),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
        ),
        margin: EdgeInsets.zero,
        child: Stack(children: [_buildProductImage(), _buildProductContent()]),
      ),
    );
  }

  Widget _buildProductImage() {
    return Positioned(
      top: 0,
      bottom: 0,
      width: AppConstants.itemImageSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
        child: Image.asset(
          '${AppConstants.imageBasePath}${product.imageFileName}.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductContent() {
    return Row(
      children: [
        const SizedBox(width: AppConstants.itemImageSize),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  product.address,
                  style: const TextStyle(color: AppColors.secondaryText),
                ),
                const SizedBox(height: 8),
                Text(
                  NumberFormatter.formatKrw(int.parse(product.price)),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildInteractionRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Icon(CupertinoIcons.chat_bubble_2),
        SizedBox(width: 1),
        Text(product.messageCount.toString()),
        const SizedBox(width: 8),
        Icon(
          product.isLiked ? Icons.favorite : Icons.favorite_border,
          color:
              product.isLiked ? AppColors.likeActive : AppColors.likeInactive,
          size: 22,
        ),
        SizedBox(width: 1),
        Text(product.likeCount.toString()),
      ],
    );
  }
}
