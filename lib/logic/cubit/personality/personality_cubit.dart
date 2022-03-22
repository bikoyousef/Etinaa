import 'dart:io';

import 'package:bloc/bloc.dart';

import '/data/models/personality.dart';
import '/helpers/db_personality.dart';

part 'personality_state.dart';

class PersonalityCubit extends Cubit<PersonalityState> {
  PersonalityCubit() : super(PersonalityInitial());

  Personality findById(String id) {
    return state.profile.firstWhere((prof) => prof.id == id);
  }

  Future<void> addProfile(
    File pickedImage,
    String name,
    String email,
    String phoneNumber,
  ) async {

    final newProfile = Personality(
      id: DateTime.now().toString(),
      image: pickedImage,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
    );
    state.profile.add(newProfile);
   
    DBPersonality.insert(
      'user_profile',
      {
        'id': newProfile.id,
        'image': newProfile.image.path,
        'name': newProfile.name,
        'email': newProfile.email,
        'phone_number': newProfile.phoneNumber,
      },
    );

     emit(
      PersonalityUpdate(
        state.profile,
        !state.change,
      ),
    );
  }

  Future<void> fetchAndSetRequests() async {

    final dataList = await DBPersonality.getData('user_profile');
    
    state.profile = dataList
        .map(
          (per) => Personality(
            id: per['id'],
            image: per['image'],
            name: per['name'],
            email: per['email'],
            phoneNumber: per['phone_number'],
          ),
        )
        .toList();

    emit(
      PersonalityUpdate(
        state.profile,
        !state.change,
      ),
    );
  }
}
