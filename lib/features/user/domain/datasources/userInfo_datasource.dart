import 'package:vales_app/features/user/domain/entities/user_info.dart';

abstract class UserInfoDatasource {
  Future<UserInfo> getUserInfo(String token);
  Future<void> updateUserInfo(UserInfo userInfo, token);
}
