import 'package:apple_market/core/utils/snackbar_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/constants/app_constants.dart';
import 'home_view_model.dart';
import 'widgets/product_list_item.dart';
import 'widgets/scroll_to_top_button.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _isScrolledToTop = true;
  final _listController = ScrollController();

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    _updateScrollPosition(notification.metrics.pixels);
    return false;
  }

  void _updateScrollPosition(double scrollPosition) {
    final isAtTop = scrollPosition <= 0;
    if (_isScrolledToTop != isAtTop) {
      setState(() {
        _isScrolledToTop = isAtTop;
      });
    }
  }

  Future<void> _handleScrollToTop() async {
    await _listController.animateTo(
      0,
      duration: AppConstants.fadeTransition,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBg,
        centerTitle: false,
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell, size: 27),
            onPressed:
                () => SnackbarUtil.showSnackBar(context, '알림 기능을 준비 중이에요'),
          ),
        ],
      ),
      body: _buildBody(homeState),
      floatingActionButton: ScrollToTopButton(
        isAtTop: _isScrolledToTop,
        onScrollToTop: _handleScrollToTop,
      ),
    );
  }

  Widget _buildBody(HomeState homeState) {
    if (homeState.isLoading) {
      return const Center(child: CupertinoActivityIndicator(radius: 18));
    } else if (homeState.errorMessage != null) {
      return Center(child: Text(homeState.errorMessage!));
    }

    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.separated(
        controller: _listController,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        itemCount: homeState.items.length,
        itemBuilder: (_, index) {
          return ProductListItem(
            key: ValueKey(homeState.items[index].id),
            product: homeState.items[index],
          );
        },
        separatorBuilder: (_, _) => const Divider(height: 30),
      ),
    );
  }
}
