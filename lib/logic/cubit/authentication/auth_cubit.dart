import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';

import 'dart:convert';
import 'dart:async';

import '/data/models/http_exception.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> _authenticate(
    String? email,
    String? password,
    String urlSegment,
  ) async {

    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDrAsFSkemc1EA8xIwjW-3r2NtPJYseBso');
    try {
      final response = await http.post(
        url,
        body: jsonEncode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = jsonDecode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(
          responseData['error']['message'],
        );
      }
      state.token = responseData['idToken'];
      state.userId = responseData['localId'];
      state.expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      
      _autoLogout();
     
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': state.token,
          'userId': state.userId,
          'expirydate': state.expiryDate?.toIso8601String(),
        },
      );
      await prefs.setString('userData', userData);
       emit(
        AuthUpdate(
          state.token!,
          state.expiryDate!,
          state.userId!,
          !state.change,
        ),
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signUp(
    String? email,
    String? password,
  ) async {
    return _authenticate(
      email,
      password,
      'signUp',
    );
  }

  Future<void> logIn(
    String? email,
    String? password,
  ) async {
    return _authenticate(
      email,
      password,
      'signInWithPassword',
    );
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userData')) {
      final data = prefs.getString('userData');
      final exractedUserData = json.decode(data!) as Map;
      final expiryDate = DateTime.parse(exractedUserData['expirydate']);
      if (expiryDate.isAfter(DateTime.now())) {
        state.token = exractedUserData['token'];
        state.userId = exractedUserData['userId'];
        state.expiryDate = expiryDate;
        emit(
          AuthUpdate(
            state.token!,
            state.expiryDate!,
            state.userId!,
            !state.change,
          ),
        );
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    if (state.authTimer != null) {
      state.authTimer?.cancel();
      state.authTimer = null;
    }
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
    emit(
      AuthUpdate(
        state.token!,
        state.expiryDate!,
        state.userId!,
  !state.change,
      ),
    );
  }

  void _autoLogout() {
    if (state.authTimer != null) {
      state.authTimer?.cancel();
    }
    final timeToExpiry = state.expiryDate?.difference(DateTime.now()).inSeconds;
    state.authTimer = Timer(Duration(seconds: timeToExpiry!), logout);
  }
}
