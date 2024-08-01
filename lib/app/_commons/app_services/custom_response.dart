import 'dart:convert';

import 'package:http/http.dart';

import 'error_handle.dart';

class CustomResponse {
  final Response? response;
  bool hasError = false;
  String errorMessage = "No data returned from the API";
  dynamic data;

  CustomResponse(this.response) {
    try {
      if (response == null) {
        hasError = true;
        errorMessage = "Response is null";
        return;
      }

      Map<String, dynamic> dataMap = jsonDecode(response!.body);

      if (dataMap.isEmpty) {
        hasError = true;
        errorMessage = 'No data returned from the API.';
        return;
      }

      if (dataMap.containsKey("error")) {
        hasError = true;
        errorMessage = dataMap["errors"];
        return;
      }

      if (response!.statusCode >= 200 && response!.statusCode < 300) {
        data = dataMap;
        return;
      }

      hasError = true;
      errorMessage = "Error: ${response!.statusCode}, ${response!.reasonPhrase}";
    } catch (error, stackTrace) {
      Errorhandler.report(error, stackTrace);
    }
  }
}
