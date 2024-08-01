import 'package:http/http.dart';
import 'package:vibe/app/_commons/app_services/api_request.dart';
import 'package:vibe/app/_commons/app_services/custom_response.dart';

import '../../../_commons/app_services/error_handle.dart';

class EventsDatasource extends APIRequest {
  Future<CustomResponse> getEvents(String categorie) async {
    Response? response;
    try {
      response = await this.get("events.json?keyword=$categorie&&countryCode=GB&");
    } catch (error, stackTrace) {
      Errorhandler.report(error, stackTrace);
    } finally {
      return CustomResponse(response);
    }
  }
}
