import 'package:dio/dio.dart';
import 'package:vales_app/features/user/domain/datasources/userInfo_datasource.dart';
import '../../domain/entities/user_info.dart';

class UserInfoDatasourceImpl extends UserInfoDatasource {
  final dio = Dio();

  @override
  Future<UserInfo> getUserInfo(String token) async {
    final response = await dio.get('http://localhost:3000/user-info',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    final user = response.data['user'];
    return UserInfo.fromJson(user);
  }

  @override
  Future<void> updateUserInfo(UserInfo userInfo, token) async {
    await dio.put('/user-info/${userInfo.id}',
        data: userInfo.toJson(),
        options: Options(headers: {'Authorization': token}));
  }
}
