import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_yaax/models/product_entity.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}

class ProductNodeRepository extends ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    var response =
        await http.get(Uri.parse('https://yaax.herokuapp.com/api/product'));
    if (response.statusCode == HttpStatus.ok) {
      var products = jsonDecode(response.body) as List;
      return products.map((rawPost) => Product.fromMap(rawPost)).toList();
    } else {
      throw 'Error: response error';
    }
  }
}
