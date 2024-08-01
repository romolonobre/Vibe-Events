import 'package:vibe/app/_commons/app_services/entity_adaptor.dart';
import 'package:vibe/app/_commons/app_services/helper.dart';
import 'package:vibe/app/home/data/venue_adapter.dart';
import 'package:vibe/app/home/interactor/entities/event.dart';

class EventAdapter implements EntityAdaptor<Event> {
  @override
  Event fromJson(json) {
    return Event(
        id: Helper.getString(json['id']),
        name: Helper.getString(json['name']),
        imagesUrl: _parseImages(json['images']),
        date: Helper.getString(json['dates']['start']?['localDate']),
        time: Helper.getString(json['dates']['start']?['localTime']),
        buyTicketUrl: Helper.getString(json['url']),
        ticketPrice: _parsePrice(json['priceRanges']),
        venue: VenueAdapter().parseVenue(json["_embedded"]));
  }

  @override
  List<Event> fromJsonToList(json) {
    if (json == null) return [];
    return List<Event>.from(json['events'].map((event) => fromJson(event)));
  }

  _parseImages(dynamic json) {
    if (json == null || json is! List) return [];
    List<String> images = [];

    for (var image in json) {
      images.add(image['url']);
    }
    return Helper.getStringList(images);
  }

  _parsePrice(dynamic json) {
    if (json == null || json is! List) return '';
    return Helper.getString(json.first['min']);
  }
}
