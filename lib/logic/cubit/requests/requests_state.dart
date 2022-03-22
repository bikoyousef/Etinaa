part of 'requests_cubit.dart';

abstract class RequestsState {
  RequestsState({
    required this.requests,
    required this.change,
  });

  List<Request> requests;
  final bool change;

  List<Request> get request {
    return [...requests];
  }
}

class RequestsInitial extends RequestsState {
  RequestsInitial()
      : super(
          requests: [],
          change: false,
        );
}

class RequestsUpdate extends RequestsState {
  RequestsUpdate(
    List<Request> req,
    bool chang,
  ) : super(
          requests: req,
          change: chang,
        );
}
