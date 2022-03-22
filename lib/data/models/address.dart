import './address_location.dart';

class Address {
  final String id;
  final String title;
  final AddressLocation location;

  Address({
    required this.id,
    required this.title,
    required this.location,
  });
}