import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:request_api_console/core/config/environment.dart';
import 'package:request_api_console/models/user.dart';

class UserService {
  Future<Either<String, UserModel>> getUser(int id) async {
    try {
      final response = await http.get(
        Uri.parse('${Environment.baseUrlApiService}/users/$id'),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final user = UserModel.fromJson(json);
        return Right(user);
      } else {
        return Left('Error HTTP: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Excepción: $e');
    }
  }
}
