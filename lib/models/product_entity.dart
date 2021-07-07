import 'dart:math';

class Product {
  final String id;
  final String name;
  final String? image;
  final String description;
  final String brand;
  final String origin;
  final String technique;
  final String status;
  final double? price;
  final List<String> tags;
  final List<String> categories;
  final List<String> characteristics;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brand,
    required this.origin,
    required this.technique,
    required this.status,
    required this.tags,
    required this.categories,
    required this.characteristics,
    this.image,
    this.price,
  });

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      price: json['price'] ?? Random().nextInt(350).toDouble(),
      image:
          json['image'] ?? 'https://suum.mx/wp-content/uploads/2019/12/caf.jpg',
      name: json['name'],
      description: json['description'],
      brand: json['brand'],
      origin: json['origin'],
      technique: json['technique'],
      status: json['status'],
      tags: List<String>.from(json['tags'] ?? []),
      categories: List<String>.from(json['categories']),
      characteristics: List<String>.from(
        json['characteristics'],
      ),
    );
  }
}
