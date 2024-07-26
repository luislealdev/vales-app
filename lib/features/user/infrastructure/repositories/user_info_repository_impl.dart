import 'package:vales_app/features/user/domain/datasources/userInfo_datasource.dart';
import 'package:vales_app/features/user/domain/entities/user_info.dart';
import 'package:vales_app/features/user/domain/repositories/user_info_repository.dart';

class UserInfoRepositoryImpl extends UserInfoRepository {
  final UserInfoDatasource datasource;

  UserInfoRepositoryImpl(this.datasource);

  @override
  Future<UserInfo> getUserInfo(String token) {
    return datasource.getUserInfo(token);
  }

  @override
  Future<void> updateUserInfo(UserInfo userInfo, String token) {
    return datasource.updateUserInfo(userInfo, token);
  }
}
