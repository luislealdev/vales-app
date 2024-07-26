import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vales_app/features/user/domain/entities/address.dart';
import 'package:vales_app/features/user/domain/repositories/address_repository.dart';
import 'package:vales_app/features/user/infrastructure/datasources/address_datasource_impl.dart';
import 'package:vales_app/features/user/infrastructure/repositories/address_repository_impl.dart';

final addressProvider =
    StateNotifierProvider<AddressNotifier, AddressState>((ref) {
  final addressRepository = AddressRepositoryImpl(AddressDatasourceImpl());
  return AddressNotifier(addressRepository);
});

class AddressNotifier extends StateNotifier<AddressState> {
  final AddressRepository addressRepository;

  AddressNotifier(this.addressRepository) : super(AddressState());

  Future<void> loadAddress(String token) async {
    try {
      final address = await addressRepository.getAddress(token);
      state = state.copyWith(address: address, error: '');
    } catch (e) {
      state = state.copyWith(error: 'Error loading address');
    }
  }

  Future<void> updateAddress(Address address) async {
    try {
      await addressRepository.updateAddress(address);
      state = state.copyWith(address: address, error: '');
    } catch (e) {
      state = state.copyWith(error: 'Error updating address');
    }
  }
}

class AddressState {
  final Address? address;
  final String error;

  AddressState({this.address, this.error = ''});

  AddressState copyWith({Address? address, String? error}) {
    return AddressState(
      address: address ?? this.address,
      error: error ?? this.error,
    );
  }
}
