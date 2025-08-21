import '../../domain/entity/product.dart';

class ProductDto {
  final String id;
  final String name;
  final String imageFileName;
  final String description;
  final String seller;
  final String price;
  final String address;
  final int likeCount;
  final int messageCount;

  const ProductDto({
    required this.id,
    required this.name,
    required this.imageFileName,
    required this.description,
    required this.seller,
    required this.price,
    required this.address,
    required this.likeCount,
    required this.messageCount,
  });

  factory ProductDto.fromCsvColumns(List<String> columns) {
    return ProductDto(
      id: columns[0],
      imageFileName: columns[1],
      name: columns[2],
      description: columns[3],
      seller: columns[4],
      price: columns[5],
      address: columns[6],
      likeCount: int.parse(columns[7]),
      messageCount: int.parse(columns[8]),
    );
  }

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      imageFileName: imageFileName,
      description: description,
      seller: seller,
      price: price,
      address: address,
      likeCount: likeCount,
      messageCount: messageCount,
    );
  }
}