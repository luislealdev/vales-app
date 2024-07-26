import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vales_app/features/user/domain/entities/user_info.dart';
import 'package:vales_app/features/user/domain/repositories/user_info_repository.dart';
import 'package:vales_app/features/user/infrastructure/datasources/user_info_datasource_impl.dart';
import 'package:vales_app/features/user/infrastructure/repositories/user_info_repository_impl.dart';

final userInfoProvider =
    StateNotifierProvider<UserInfoNotifier, UserInfoState>((ref) {
  final userInfoRepository = UserInfoRepositoryImpl(UserInfoDatasourceImpl());
  return UserInfoNotifier(userInfoRepository);
});

class UserInfoNotifier extends StateNotifier<UserInfoState> {
  final UserInfoRepository userInfoRepository;

  UserInfoNotifier(this.userInfoRepository) : super(UserInfoState());

  Future<void> loadUserInfo(String token) async {
    try {
      final userInfo = await userInfoRepository.getUserInfo(token);
      state = state.copyWith(userInfo: userInfo, error: '');
    } catch (e) {
      state = state.copyWith(error: 'Error loading user info');
    }
  }

  Future<void> updateUserInfo(UserInfo userInfo, String token) async {
    try {
      await userInfoRepository.updateUserInfo(userInfo, token);
      state = state.copyWith(userInfo: userInfo, error: '');
    } catch (e) {
      state = state.copyWith(error: 'Error updating user info');
    }
  }
}

class UserInfoState {
  final UserInfo? userInfo;
  final String error;

  UserInfoState({this.userInfo, this.error = ''});

  UserInfoState copyWith({UserInfo? userInfo, String? error}) {
    return UserInfoState(
      userInfo: userInfo ?? this.userInfo,
      error: error ?? this.error,
    );
  }
}
