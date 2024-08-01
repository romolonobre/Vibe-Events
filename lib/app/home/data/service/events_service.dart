import '../../interactor/state/event_state.dart';

abstract class EventsService {
  Future<EventsState> getEvents(String categorie);
}
