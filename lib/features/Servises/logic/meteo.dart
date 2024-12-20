

import 'package:dio/dio.dart';

class MeteoService {
  final Dio _dio = Dio();

  Future fetchWeather() async {
    final String url = 'https://api.open-meteo.com/v1/forecast?latitude=36.7664&longitude=3.4772&current=temperature_2m&forecast_days=1';
    try {
      Response response = await _dio.get(url);
      return response.data['current']['temperature_2m'];
    } catch (e) {
      print('Error: $e');
    }
  }
}