import 'package:bloc/bloc.dart';

import '/data/models/address_location.dart';
import '/data/models/address.dart';

import '/helpers/location_helper.dart';
import '/helpers/db_address.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  Address findById(String id) {
    return state.items.firstWhere((address) => address.id == id);
  }

  Future<void> addAddress(
    String pickedTitle,
    AddressLocation pickedLocation,
  ) async {

    final address = await LocationHelper.getLocationAddress(
        pickedLocation.latitude, pickedLocation.longtiude);
    final updatedLocation = AddressLocation(
        latitude: pickedLocation.latitude,
        longtiude: pickedLocation.longtiude,
        address: address);
    final newAddress = Address(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: updatedLocation);

    state.items.add(newAddress);

    DBHelper.insert(
      'user_addresses',
      {
        'id': newAddress.id,
        'title': newAddress.title,
        'loc_lat': newAddress.location.latitude,
        'loc_lng': newAddress.location.longtiude,
        'address': newAddress.location.address!,
      },
    );

    emit(
      AddressUpdate(
        state.items,
        !state.change,
      ),
    );
  }

  Future<void> fetchAndSetAddresses() async {

    final dataList = await DBHelper.getData('user_addresses');

    state.items = dataList
        .map((itm) => Address(
            id: itm['id'],
            title: itm['title'],
            location: AddressLocation(
              latitude: itm['loc_lat'],
              longtiude: itm['loc_lng'],
              address: itm['address'],
            )))
        .toList();
        
    emit(
      AddressUpdate(
        state.items,
        !state.change,
      ),
    );
  }
}
