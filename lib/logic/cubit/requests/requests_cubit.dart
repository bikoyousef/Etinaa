import 'package:bloc/bloc.dart';

import '/data/models/request.dart';
import '/helpers/db_request.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit() : super(RequestsInitial());

  Future<void> addRequest(
    String id,
    String price,
    String date,
  ) async {

    final newRequest = Request(
      id: id,
      price: price,
      date: date,
    );

    state.requests.add(newRequest);

    DBRequest.insert(
      'user_requests',
      {
        'id': newRequest.id,
        'price': newRequest.price,
        'date': newRequest.date,
      },
    );

    emit(
      RequestsUpdate(
        state.requests,
        !state.change,
      ),
    );
  }

  Future<void> fetchAndSetRequests() async {

    final dataList = await DBRequest.getData('user_requests');

    state.requests = dataList
        .map((req) => Request(
            id: req['id'],
            price: req['price'],
            date: req['date'],
            ),)
        .toList();

    emit(
      RequestsUpdate(
        state.requests,
        !state.change,
      ),
    );
  }
}
