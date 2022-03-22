class AddressLocation {
  final double latitude;
  final double longtiude;
  final String? address;

  const AddressLocation({
    required this.latitude,
    required this.longtiude,
    this.address,
  });
}