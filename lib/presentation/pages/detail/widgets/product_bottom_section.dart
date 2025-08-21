import 'package:apple_market/core/utils/number_formatter.dart';
import 'package:apple_market/core/utils/snackbar_util.dart';
import 'package:flutter/material.dart';

import '../../../../app/constants/app_colors.dart';

class ProductBottomSection extends StatelessWidget {
  final String productId;
  final String price;
  final bool isLiked;
  final VoidCallback onLikeToggle;

  const ProductBottomSection({
    super.key,
    required this.productId,
    required this.price,
    required this.isLiked,
    required this.onLikeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLikeButton(),
            _buildPriceText(),
            _buildChatButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLikeButton() {
    return IconButton(
      onPressed: onLikeToggle,
      icon: Icon(
        isLiked ? Icons.favorite : Icons.favorite_border,
        color: isLiked ? AppColors.likeActive : AppColors.likeInactive,
      ),
    );
  }

  Widget _buildPriceText() {
    return Text(
      NumberFormatter.formatKrw(int.parse(price)),
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildChatButton(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 102,
      child: ElevatedButton(
        onPressed: () {
          SnackbarUtil.showSnackBar(context, '채팅 기능은 현재 개발 중입니다.');
        },
        child: Text('채팅하기'),
      ),
    );
  }
}
