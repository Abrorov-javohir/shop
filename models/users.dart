class Users {
  final int id;
  final String password;
  final String name;
  final String avatar;
  final String creationAt;
  final String role;
  final String imageUrl;
  final String updatedAt;

  Users({
    required this.id,
    required this.password,
    required this.name,
    required this.avatar,
    required this.creationAt,
    required this.imageUrl,
    required this.role,
    required this.updatedAt,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] ?? 0,
      password: json['password'] ?? 'No password',
      name: json['name'] ?? 'No name',
      avatar: json['images'] != null && json['images'].isNotEmpty
          ? json['images'][0]
          : 'https://via.placeholder.com/150',
      creationAt: json['creationAt'] ?? 'No Date',
      role: json['role'] ?? 'No role',
      updatedAt: json['updatedAt'] ?? 'No Date', imageUrl: '',
    );
  }
}
