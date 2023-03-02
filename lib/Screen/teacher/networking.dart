import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(
      {required this.startLng,
      required this.startLat,
      required this.endLng,
      required this.endLat});

  final String url = 'https://api.openrouteservice.org/v2/directions/';
  final String apiKey = 'AIzaSyDCZtWldohjIGPKFFo0oG6GeLEC8tXmwa0';
  final String journeyMode =
      'driving-car'; // Change it if you want or make it variable
  final double startLng;
  final double startLat;
  final double endLng;
  final double endLat;

  Future getData() async {
    final Uri uri = Uri.parse('$url$journeyMode');
    final Map<String, String> queryParams = {
      'api_key': apiKey,
      'start': '$startLng,$startLat',
      'end': '$endLng,$endLat',
    };
    final uriWithQueryParams = uri.replace(queryParameters: queryParams);
    http.Response response = await http.get(uriWithQueryParams);
    print(uriWithQueryParams);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
