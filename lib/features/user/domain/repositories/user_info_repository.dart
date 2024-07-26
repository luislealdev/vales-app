import '../entities/user_info.dart';

abstract class UserInfoRepository {
  Future<UserInfo> getUserInfo(String token);
  Future<void> updateUserInfo(UserInfo userInfo, String token);
}
