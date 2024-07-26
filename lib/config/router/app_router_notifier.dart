import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vales_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:vales_app/features/user/presentation/providers/address_provider.dart';
import 'package:vales_app/features/user/presentation/providers/user_info_provider.dart';

final goRouterNotifierProvider = Provider((ref) {
  final authNotifier = ref.read(authProvider.notifier);
  final userInfoNotifier = ref.read(userInfoProvider.notifier);
  final addressNotifier = ref.read(addressProvider.notifier);

  return GoRouterNotifier(authNotifier, userInfoNotifier, addressNotifier);
});

class GoRouterNotifier extends ChangeNotifier {
  final AuthNotifier _authNotifier;
  final UserInfoNotifier _userInfoNotifier;
  final AddressNotifier _addressNotifier;

  AuthStatus _authStatus = AuthStatus.checking;

  GoRouterNotifier(
    this._authNotifier,
    this._userInfoNotifier,
    this._addressNotifier,
  ) {
    _authNotifier.addListener((state) {
      authStatus = state.authStatus;

      if (state.authStatus == AuthStatus.authenticated && state.user != null) {
        _fetchUserDetails(state.user!.token);
      }
    });
  }

  AuthStatus get authStatus => _authStatus;

  set authStatus(AuthStatus value) {
    _authStatus = value;
    notifyListeners();
  }

  Future<void> _fetchUserDetails(String token) async {
    try {
      await _userInfoNotifier.loadUserInfo(token);
      await _addressNotifier.loadAddress(token);
      // Puedes actualizar algún estado adicional aquí si es necesario
    } catch (e) {
      // Manejar error si es necesario
    }
  }
}
