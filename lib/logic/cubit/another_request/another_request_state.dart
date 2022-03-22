part of 'another_request_cubit.dart';

abstract class AnotherRequestState {
  AnotherRequestState({
    required this.othRequest,
    required this.change,
  });

  List<AnotherRequest> othRequest;
  final bool change;

  List<AnotherRequest> get oth {
    return [...othRequest];
  }
}

class AnotherRequestInitial extends AnotherRequestState {
  AnotherRequestInitial()
      : super(
          othRequest: [],
          change: false,
        );
}

class AnotherRequestUpdate extends AnotherRequestState {
  AnotherRequestUpdate(
    List<AnotherRequest> cal,
    bool chang,
  ) : super(
          othRequest: cal,
          change: chang,
        );
}
