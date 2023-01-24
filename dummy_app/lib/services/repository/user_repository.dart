import 'package:dio/dio.dart';
import 'package:dummy_app/models/user_model.dart';
import 'package:dummy_app/services/api/dio_exception.dart';

import '../api/user/user_api.dart';

class UserRepository {
  final UserApi userApi;

  UserRepository(this.userApi);

  Future<List<UserModel>> getUsersRequested() async {
    try {
      List<UserModel> list = [];
      final response = await userApi.getUsersApi();
      // print(response.data);
      var data = response.data;
      for (Map i in data) {
        // print(i['name']);
        list.add(UserModel.fromJson(i));
      }
      // print(list.length);
      return list;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }


  // Future<Users> updateUserRequested(int id, String name, String job) async {
  //   try {
  //     final response = await userApi.updateUserApi(id, name, job);
  //     return Users.fromJson(response.data);
  //   } on DioError catch (e) {
  //     final errorMessage = DioExceptions.fromDioError(e).toString();
  //     throw errorMessage;
  //   }
  // }

  Future<void> deleteUserRequested(int id) async {
    try {
      await userApi.deleteUserApi(id);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
