class Product {
  final int id;
  final String title;
  final String imageUrl;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      imageUrl: json['images'] != null && json['images'].isNotEmpty ? json['images'][0] : 'https://via.placeholder.com/150', // Provide a default image URL
      price: (json['price'] ?? 0).toDouble(),
    );
  }
}
