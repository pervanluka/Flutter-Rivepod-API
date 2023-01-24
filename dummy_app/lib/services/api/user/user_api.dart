import 'package:dio/dio.dart';

import '../constants/endpoints.dart';
import '../dio_client.dart';

class UserApi {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  // Future<Response> addUserApi(String name, String username) async {
  //   try {
  //     final Response response = await dioClient.post(
  //       Endpoints.users,
  //       data: {
  //         'name': name,
  //         'username': username,
  //       },
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<Response> getUsersApi() async {
    try {
      final Response response = await dioClient.get(Endpoints.users);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Future<Response> updateUserApi(int id, String name, String username) async {
  //   try {
  //     final Response response = await dioClient.put(
  //       Endpoints.users + '/$id',
  //       data: {
  //         'name': name,
  //         'username': username,
  //       },
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> deleteUserApi(int id) async {
    try {
      final response = await dioClient.delete('${Endpoints.users}/$id');
    } catch (e) {
      rethrow;
    }
  }
}
