import 'package:vibe/app/home/data/datasource/events_datasource.dart';
import 'package:vibe/app/home/data/event_adapter.dart';
import 'package:vibe/app/home/data/service/events_service.dart';
import 'package:vibe/app/home/interactor/entities/event.dart';
import 'package:vibe/app/home/interactor/state/event_state.dart';

class EventsServiceImpl implements EventsService {
  final EventsDatasource datasource = EventsDatasource();

  @override
  Future<EventsState> getEvents(String categorie) async {
    try {
      final response = await datasource.getEvents(categorie);
      if (response.hasError) {
        return EventsErrorState(errorMessage: response.errorMessage);
      }
      final result = response.data["_embedded"];
      final List<Event> events = EventAdapter().fromJsonToList(result);

      return EventsLoadedState(events: events);
    } catch (e) {
      return EventsErrorState(errorMessage: e.toString());
    }
  }
}
