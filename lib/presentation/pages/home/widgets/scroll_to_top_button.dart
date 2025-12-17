import 'package:flutter/material.dart';
import '../../../../app/constants/app_constants.dart';

class ScrollToTopButton extends StatelessWidget {
  final bool isAtTop;
  final Future<void> Function() onScrollToTop;

  const ScrollToTopButton({
    super.key,
    required this.isAtTop,
    required this.onScrollToTop,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isAtTop ? 0 : 1,
      duration: AppConstants.fadeTransition,
      child: FloatingActionButton(
        onPressed: isAtTop ? null : onScrollToTop,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: const CircleBorder(
          side: BorderSide(color: Colors.grey, width: 1),
        ),
        child: const Icon(Icons.vertical_align_top),
      ),
    );
  }
}