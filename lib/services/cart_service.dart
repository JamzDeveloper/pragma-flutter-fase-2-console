import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:request_api_console/core/config/environment.dart';
import 'package:request_api_console/models/cart.dart';

class CartService {
  final String _baseUrl = '${Environment.baseUrlApiService}/carts';

  Future<Either<String, Cart>> getCartById(int id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/$id'));

      if (response.statusCode == 200) {
        final cart = Cart.fromJson(jsonDecode(response.body));
        return Right(cart);
      } else {
        return Left('Error: código ${response.statusCode}');
      }
    } catch (e) {
      return Left('Excepción: ${e.toString()}');
    }
  }
}
