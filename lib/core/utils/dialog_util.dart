import 'package:flutter/material.dart';

class DialogUtil {
  static Future<bool?> showRemovalConfirmation(BuildContext context) {
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('상품 삭제'),
          content: const Text('정말로 이 상품을 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('삭제'),
            ),
          ],
        );
      },
    );
  }
}