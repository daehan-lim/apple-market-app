import 'package:apple_market/app/data_providers.dart';
import 'package:apple_market/core/utils/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/constants/app_constants.dart';
import '../../../core/exceptions/product_data_exceptions.dart';
import '../../../domain/entity/product.dart';

class HomeState {
  final List<Product> items;
  final bool isLoading;
  final String? errorMessage;

  const HomeState({
    this.items = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  HomeState copyWith({
    List<Product>? items,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return HomeState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    Future.microtask(() => _initializeProducts());
    return const HomeState(isLoading: true);
  }

  Future<void> _initializeProducts() async {
    try {
      await Future.delayed(AppConstants.dataLoadDelay);
      final products =
          await ref.read(productRepositoryProvider).getAllProducts();
      state = state.copyWith(items: products, isLoading: false);
    } catch (error, stack) {
      logError(error, stack, reason: 'Failed to load products');
      state = state.copyWith(
        errorMessage: error is ProductDataException
            ? '상품 정보를 불러오는데 실패했습니다. 앱을 다시 실행해주세요.'
            : '일시적인 오류가 발생했습니다. 잠시 후 다시 시도해주세요.',
        isLoading: false,
      );
    }
  }

  void toggleProductLike(String productId) {
    final index = state.items.indexWhere((product) => product.id == productId);
    if (index != -1) {
      final updatedItems = List<Product>.from(state.items);
      updatedItems[index] = _updateProductLikeStatus(updatedItems[index]);
      state = state.copyWith(items: updatedItems);
    }
  }

  Product _updateProductLikeStatus(Product product) {
    final newLikeStatus = !product.isLiked;
    final newLikeCount =
        newLikeStatus ? product.likeCount + 1 : product.likeCount - 1;
    return product.copyWith(isLiked: newLikeStatus, likeCount: newLikeCount);
  }

  void removeProduct(String productId) {
    final updatedItems =
        state.items.where((product) => product.id != productId).toList();
    state = state.copyWith(items: updatedItems);
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(
  HomeViewModel.new,
);
