class Product {
  final String id;
  final String name;
  final String imageFileName;
  final String description;
  final String seller;
  final String price;
  final String address;
  final int likeCount;
  final int messageCount;
  final bool isLiked;

  const Product({
    required this.id,
    required this.name,
    required this.imageFileName,
    required this.description,
    required this.seller,
    required this.price,
    required this.address,
    required this.likeCount,
    required this.messageCount,
    this.isLiked = false,
  });

  Product copyWith({
    String? id,
    String? name,
    String? imageFileName,
    String? description,
    String? seller,
    String? price,
    String? address,
    int? likeCount,
    int? messageCount,
    bool? isLiked,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      imageFileName: imageFileName ?? this.imageFileName,
      description: description ?? this.description,
      seller: seller ?? this.seller,
      price: price ?? this.price,
      address: address ?? this.address,
      likeCount: likeCount ?? this.likeCount,
      messageCount: messageCount ?? this.messageCount,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}