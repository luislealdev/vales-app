import 'package:dio/dio.dart';
import 'package:vales_app/config/constants/environment.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(BaseOptions(
          baseUrl: Environment.apiUrl, // Aquí defines la URL base
        )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Agregar el token si está disponible
        final token = await _getToken(); // Función para obtener el token
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
  }

  Dio get dio => _dio;

  Future<String?> _getToken() async {
    // Implementar la lógica para obtener el token, por ejemplo desde un almacenamiento seguro
    return 'your_token'; // Aquí iría tu lógica real para obtener el token
  }
}
