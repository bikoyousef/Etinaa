part of 'address_cubit.dart';

abstract class AddressState {
  AddressState({
    required this.items,
    required this.change,
  });

  List<Address> items;
  final bool change;

  List<Address> get item {
    return [...items];
  }
}

class AddressInitial extends AddressState {
  AddressInitial()
      : super(
          items: [],
          change: false,
        );
}

class AddressUpdate extends AddressState {
  AddressUpdate(
    List<Address> itm,
    bool chang,
  ) : super(
          items: itm,
          change: chang,
        );
}
