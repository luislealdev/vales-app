import 'package:dio/dio.dart';
import 'package:vales_app/config/constants/environment.dart';
import 'package:vales_app/features/auth/domain/domain.dart';
import 'package:vales_app/features/auth/infrastructure/infrastructure.dart';

class AuthDataSourceImpl extends AuthDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
  ));

  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get(
        '/auth/check-status',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.data['ok'] == false &&
          response.data['message'] ==
              'Cuenta desactivada. Por favor, contacte al administrador.') {
        throw CustomError(response.data['message']);
      }

      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError('Token incorrecto');
      }
      throw CustomError(
          'Error desconocido al verificar el estado de autenticación');
    } catch (e) {
      throw CustomError('Error desconocido');
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio
          .post('/auth/login', data: {'email': email, 'password': password});
          print(response.data);
      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(
            e.response?.data['message'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
