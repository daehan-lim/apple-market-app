import 'package:apple_market/data/data_source/product_data_source.dart';

import '../../domain/entity/product.dart';

class ProductRepository {
  final ProductDataSource _dataSource;

  const ProductRepository(this._dataSource);

  Future<List<Product>> getAllProducts() async {
    final productDtos = await _dataSource.loadProductData();
    return productDtos.map((dto) => dto.toEntity()).toList();
  }
}
