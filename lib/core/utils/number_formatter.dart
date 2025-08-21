import 'package:intl/intl.dart';

class NumberFormatter {
  static String formatKrw(int number) {
    final formatCurrency = NumberFormat.currency(locale: 'ko_KR', symbol: '');
    return number > 0 ? '${formatCurrency.format(number)}원' : '0원(무료)';
  }
}