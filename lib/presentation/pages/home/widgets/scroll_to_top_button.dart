import 'package:flutter/material.dart';
import '../../../../app/constants/app_constants.dart';

class ScrollToTopButton extends StatefulWidget {
  final bool isAtTop;
  final Future<void> Function() onScrollToTop;

  const ScrollToTopButton({
    super.key,
    required this.isAtTop,
    required this.onScrollToTop,
  });

  @override
  State<ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isAtTop ? 0 : 1,
      duration: AppConstants.fadeTransition,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.isAtTop ? null : () async {
          await widget.onScrollToTop();
          setState(() => _isPressed = false);
        },
        child: FloatingActionButton(
          onPressed: null,
          backgroundColor: _isPressed ? Colors.blue : Colors.white,
          foregroundColor: _isPressed ? Colors.white : Colors.black,
          shape: const CircleBorder(
            side: BorderSide(color: Colors.grey, width: 1),
          ),
          child: const Icon(Icons.vertical_align_top),
        ),
      ),
    );
  }
}