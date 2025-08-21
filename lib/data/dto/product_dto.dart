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

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'] as String,
      name: json['name'] as String,
      imageFileName: json['imageFileName'] as String,
      description: json['description'] as String,
      seller: json['seller'] as String,
      price: json['price'] as String,
      address: json['address'] as String,
      likeCount: json['likeCount'] as int,
      messageCount: json['messageCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageFileName': imageFileName,
      'description': description,
      'seller': seller,
      'price': price,
      'address': address,
      'likeCount': likeCount,
      'messageCount': messageCount,
    };
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