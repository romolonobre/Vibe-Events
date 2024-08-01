import 'package:vibe/app/_commons/app_services/entity_adaptor.dart';
import 'package:vibe/app/_commons/app_services/helper.dart';

import '../interactor/entities/venue.dart';

class VenueAdapter implements EntityAdaptor<Venue> {
  @override
  Venue fromJson(json) {
    return Venue(
      name: Helper.getString(json['name']),
      id: Helper.getString(json['id']),
      postalCode: Helper.getString(json['postalCode']),
      parkingDetail: Helper.getString(json["boxOfficeInfo"]?['parkingDetail']),
      city: Helper.getString(json['city']?["name"]),
      address: Helper.getString(json['address']?["line1"]),
    );
  }

  parseVenue(dynamic json) {
    final jsonList = json['venues'];
    if (jsonList == null || jsonList is! List || jsonList.isEmpty) return null;

    return fromJson(jsonList[0]);
  }

  @override
  List<Venue> fromJsonToList(json) => [];
}
