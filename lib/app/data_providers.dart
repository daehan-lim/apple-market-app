import 'package:apple_market/data/data_source/product_data_source.dart';
import 'package:apple_market/data/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productDataSourceProvider = Provider<ProductDataSource>(
  (ref) => ProductDataSource(),
);

final productRepositoryProvider = Provider<ProductRepository>(
  (ref) => ProductRepository(ref.read(productDataSourceProvider)),
);
