import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vibe/app/_commons/app_services/env.dart';

class APIRequest {
  final String baseUrl = Env.apiBaseUrl;
  final apiKey = "apikey=${Env.token}";

  final Map<String, String> requestHeaders = {
    'Authorization': Env.token,
    'accept': 'application/json',
  };

  @protected
  Future<http.Response?> get(
    String endpoint, {
    Map<String, String>? headers,
  }) {
    return http.get(
      Uri.parse("$baseUrl$endpoint$apiKey"),
      headers: requestHeaders,
    );
  }
}
