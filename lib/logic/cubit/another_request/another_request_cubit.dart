import 'package:bloc/bloc.dart';

import '/data/models/another_request.dart';
import '/helpers/db_another_request.dart';

part 'another_request_state.dart';

class AnotherRequestCubit extends Cubit<AnotherRequestState> {
  AnotherRequestCubit() : super(AnotherRequestInitial());

  Future<void> addCall(
    String name,
    String phoneNumber,
    String email,
    String requestType,
    String requestDetails,
  ) async {

    final newOthRequest = AnotherRequest(
      id: DateTime.now().toString(),
      name: name,
      phoneNumber: phoneNumber,
      email: email,
      requestType: requestType,
      requestDetails: requestDetails,
    );

    state.othRequest.add(newOthRequest);

    DBAnotherRequest.insert(
      'user_another_request',
      {
        'id': newOthRequest.id,
        'name': newOthRequest.name,
        'phone_number': newOthRequest.phoneNumber,
        'email': newOthRequest.email,
        'request_type': newOthRequest.requestType,
        'request_details': newOthRequest.requestType,
      },
    );

    emit(
      AnotherRequestUpdate(
        state.othRequest,
        !state.change,
      ),
    );
  }
}
