import 'package:get_it/get_it.dart';
import 'package:vibe/app/home/data/service/events_service.dart';
import 'package:vibe/app/home/data/service/events_service_impl.dart';
import 'package:vibe/app/home/interactor/events_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupInjector() async {
  getIt.registerFactory<EventsService>(() => EventsServiceImpl());
  getIt.registerFactory(() => EventsCubit(getIt()));
}
