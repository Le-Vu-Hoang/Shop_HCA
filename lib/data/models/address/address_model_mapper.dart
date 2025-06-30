import 'package:e_commercial/data/models/address/address_model.dart';
import 'package:e_commercial/domain/entities/address.dart';

extension AddressXModel on AddressModel {
  AddressEntity toEntity() {
    return AddressEntity(id: id, address: address, isDefault: isDefault);
  }
}
