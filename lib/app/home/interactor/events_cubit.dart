import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe/app/home/data/service/events_service.dart';
import 'package:vibe/app/home/interactor/state/event_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventsService service;
  EventsCubit(this.service) : super(IndleState());

  Future<void> getEvents(String categorie) async {
    emit(EventsLoadingState());
    final result = await service.getEvents(categorie);
    emit(result);
    log(result.toString());
  }
}
