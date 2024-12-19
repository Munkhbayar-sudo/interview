class Product {
  final int id;
  final String name;
  final String title;

  Product({
    required this.id,
    required this.name,
    required this.title,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
    };
  }
}
