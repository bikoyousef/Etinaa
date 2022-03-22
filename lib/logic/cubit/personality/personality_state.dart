part of 'personality_cubit.dart';

abstract class PersonalityState {
  PersonalityState({
    required this.profile,
    required this.change,
  });
  
  List<Personality> profile;
  final bool change;

  List<Personality> get prof {
    return [...profile];
  }
}

class PersonalityInitial extends PersonalityState {
  PersonalityInitial()
      : super(
          profile: [],
          change: false,
        );
}

class PersonalityUpdate extends PersonalityState {
  PersonalityUpdate(
    List<Personality> prof,
    bool chang,
  ) : super(
          profile: prof,
          change: chang,
        );
}
