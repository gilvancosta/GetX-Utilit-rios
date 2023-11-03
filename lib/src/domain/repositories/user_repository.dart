import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:getx_utilitarios/src/domain/entities/user_entity.dart';

class UserRepository {
  final Dio dio;
  UserRepository({
    required this.dio,
  });

  Future<List<UserEntity>> getUsers(int page, int limit) async {
    try {
      final result = await dio.get('/users', queryParameters: {
        'page': page,
        'limit': limit,
      });

      return result.data.map<UserEntity>((user) => UserEntity.fromMap(user)).toList();
    } on DioException catch (e, s) {
      log('Erro ao carregar os Usuários', error: e, stackTrace: s);
      throw Exception('Erro ao carregar os Usuários');
    }
  }
}
