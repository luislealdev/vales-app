import '../entities/address.dart';

abstract class AddressRepository {
  Future<Address> getAddress(String token);
  Future<void> updateAddress(Address address);
}
