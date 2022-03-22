import 'package:bloc/bloc.dart';

import '/data/models/call_us.dart';
import '/helpers/db_call_us.dart';

part 'call_state.dart';

class CallCubit extends Cubit<CallState> {
  CallCubit() : super(CallInitial());

  Future<void> addCall(
    String name,
    String phoneNumber,
    String email,
    String request,
  ) async {
    
    final newCall = CallUs(
      id: DateTime.now().toString(),
      name: name,
      phoneNumber: phoneNumber,
      email: email,
      request: request,
    );
    state.callUs.add(newCall);
    
    DBCallUs.insert(
      'user_call_us',
      {
        'id': newCall.id,
        'name': newCall.name,
        'phone_number': newCall.phoneNumber,
        'email': newCall.email,
        'request': newCall.request,
      },
    );

    emit(
      CallUpdate(
        state.callUs,
        !state.change,
      ),
    );
  }
}
