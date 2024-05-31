class Categories {
  final int id;
  final String name;
  final String imageUrl;
  final String creationAt;
  final String updatedAt;

  Categories({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'No name',
      imageUrl: json['images'] != null && json['images'].isNotEmpty
          ? json['images'][0]
          : 'https://via.placeholder.com/150',
      creationAt: json['creationAt'] ?? 'No Date',
      updatedAt: json['updatedAt'] ?? 'No Date',
    );
  }
}
