import 'data_state.dart';

abstract class IEvent {
  late final String eventName;
  late final DataState dataState;

  IEvent({
    required this.eventName,
    required this.dataState,
  });
}
