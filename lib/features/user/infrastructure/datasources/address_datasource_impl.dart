import 'package:dio/dio.dart';
import 'package:vales_app/features/user/domain/datasources/address_datasource.dart';
import '../../domain/entities/address.dart';

class AddressDatasourceImpl extends AddressDatasource {
  final dio = Dio();

  @override
  Future<Address> getAddress(String token) async {
    final response = await dio.get('http://localhost:3000/address',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return Address.fromJson(response.data['address']);
  }

  @override
  Future<void> updateAddress(Address address) async {
    await dio.put('/address/${address.id}', data: address.toJson());
  }
}
