part of 'auth_cubit.dart';

abstract class AuthState {
  AuthState({
    required this.token,
    required this.expiryDate,
    required this.userId,
    required this.change,
  });
  
  String? token;
  DateTime? expiryDate;
  String? userId;
  Timer? authTimer;
  final bool change;

  bool get isAuth {
    return tok != null;
  }

  String? get tok {
    if (expiryDate != null &&
        expiryDate!.isAfter(DateTime.now()) &&
        token != null) {
      return token;
    }
    return null;
  }
}

class AuthInitial extends AuthState {
  AuthInitial()
      : super(
          token: 'token',
          expiryDate: DateTime.now(),
          userId: 'userId',
          change: false,
        );
}

class AuthUpdate extends AuthState {
  AuthUpdate(
    String t,
    DateTime d,
    String id,
    bool chang,
  ) : super(
          token: t,
          expiryDate: d,
          userId: id,
          change: chang,
        );
}
