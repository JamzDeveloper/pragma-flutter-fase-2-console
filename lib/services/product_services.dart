import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:request_api_console/core/config/environment.dart';
import '../models/product.dart';

class ProductService {

  Future<Either<String, ProductModel>> getProduct(int id) async {
    try {
      final response = await http.get(Uri.parse('${Environment.baseUrlApiService}/products/$id'));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final product = ProductModel.fromJson(json);
        return Right(product);
      } else {
        return Left('Error HTTP: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Excepción: $e');
    }
  }
}
