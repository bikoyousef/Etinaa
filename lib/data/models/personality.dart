import 'dart:io';

class Personality {
  final String id;
  final File image;
  final String name;
  final String email;
  final String phoneNumber;

  Personality({
    required this.id,
    required this.image,
    required this.name,
    required this.email,
    required this.phoneNumber
  });
}
