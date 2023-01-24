
import 'package:dio/dio.dart';
import 'package:dummy_app/services/api/dio_client.dart';
import 'package:dummy_app/services/api/user/user_api.dart';
import 'package:dummy_app/services/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) => Dio(),);

final dioClientProvider = Provider<DioClient>((ref) => DioClient(ref.watch(dioProvider)),);

final userApiProvider = Provider<UserApi>((ref) => UserApi(dioClient: ref.watch(dioClientProvider)),);

final userProvider = Provider<UserRepository>((ref) => UserRepository(ref.watch(userApiProvider)));
