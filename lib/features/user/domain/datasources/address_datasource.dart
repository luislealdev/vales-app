import '../entities/address.dart';

abstract class AddressDatasource {
  Future<Address> getAddress(String token);
  Future<void> updateAddress(Address address);
}
