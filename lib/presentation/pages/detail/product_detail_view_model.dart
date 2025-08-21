import 'package:apple_market/presentation/pages/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entity/product.dart';

class ProductDetailViewModel
    extends AutoDisposeFamilyNotifier<Product, Product> {
  @override
  Product build(Product arg) {
    return arg;
  }

  void handleLikeToggle() {
    state = state.copyWith(isLiked: !state.isLiked);
    // Update the main home state
    ref.read(homeViewModelProvider.notifier).toggleProductLike(arg.id);
  }
}

final productDetailViewModelProvider = NotifierProvider.autoDispose
    .family<ProductDetailViewModel, Product, Product>(
      ProductDetailViewModel.new,
    );
