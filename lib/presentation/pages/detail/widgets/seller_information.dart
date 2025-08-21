import 'package:flutter/material.dart';

import '../../../../app/constants/app_colors.dart';
import '../../../../app/constants/app_constants.dart';

class SellerInformation extends StatelessWidget {
  final String sellerName;
  final String location;

  const SellerInformation({
    super.key,
    required this.sellerName,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                _buildSellerAvatar(),
                const SizedBox(width: 12),
                _buildSellerDetails(),
                _buildTemperatureInfo(),
              ],
            ),
          ),
          const Divider(
            color: AppColors.dividerColor,
            thickness: 1.9,
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildSellerAvatar() {
    return Container(
      width: AppConstants.avatarRadius,
      height: AppConstants.avatarRadius,
      decoration: const BoxDecoration(
        color: AppColors.profileAvatar,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person, size: 30, color: Colors.white),
    );
  }

  Widget _buildSellerDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sellerName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            location,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemperatureInfo() {
    return Column(
      children: [
        Text(
          '${AppConstants.tempValue}${AppConstants.tempUnit}',
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.temperatureText,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          AppConstants.tempLabel,
          style: TextStyle(
            fontSize: 15,
            color: AppColors.secondaryText,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
