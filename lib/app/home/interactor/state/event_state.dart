import '../entities/event.dart';

abstract class EventsState {}

class IndleState extends EventsState {}

class EventsLoadingState extends EventsState {}

class EventsLoadedState extends EventsState {
  final List<Event> events;

  EventsLoadedState({required this.events});
}

class EventsErrorState extends EventsState {
  final String errorMessage;

  EventsErrorState({required this.errorMessage});
}
