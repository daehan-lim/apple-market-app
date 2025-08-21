/// Exception thrown when market data operations fail.
class ProductDataException implements Exception {
  final String message;

  const ProductDataException(this.message);

  @override
  String toString() => 'MarketDataException: $message';
}