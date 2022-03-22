part of 'call_cubit.dart';

abstract class CallState {
  CallState({
    required this.callUs,
    required this.change,
  });

  List<CallUs> callUs;
  final bool change;

  List<CallUs> get call {
    return [...callUs];
  }
}

class CallInitial extends CallState {
  CallInitial()
      : super(
          callUs: [],
          change: false,
        );
}

class CallUpdate extends CallState {
  CallUpdate(
    List<CallUs> cal,
    bool chang,
  ) : super(
          callUs: cal,
          change: chang,
        );
}
