import 'package:vales_app/features/user/domain/datasources/address_datasource.dart';
import 'package:vales_app/features/user/domain/entities/address.dart';
import 'package:vales_app/features/user/domain/repositories/address_repository.dart';

class AddressRepositoryImpl extends AddressRepository {
  final AddressDatasource datasource;

  AddressRepositoryImpl(this.datasource);

  @override
  Future<Address> getAddress(String token) {
    return datasource.getAddress(token);
  }

  @override
  Future<void> updateAddress(Address address) {
    return datasource.updateAddress(address);
  }
}
