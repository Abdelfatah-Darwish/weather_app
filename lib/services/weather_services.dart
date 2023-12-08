import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '795bdbdbf8ec4f9691b182739231311';
//http://api.weatherapi.com/v1/forecast.json?key=795bdbdbf8ec4f9691b182739231311&q=Cairo&days=1
  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'opp error , try later!';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('there are error try later!');
    }
  }
}


























// import 'package:dio/dio.dart';
// import 'package:weather_app/models/weather_model.dart';

// class WeatherServices {
//   final Dio dio;

//   WeatherServices({required this.dio});

//   Future<WeatherModel> getCurrentWeather() async {
//     Response response = await dio.get(
//         'http://api.weatherapi.com/v1/forecast.json?key=795bdbdbf8ec4f9691b182739231311&q=London&days=1');

//     WeatherModel weatherModel = WeatherModel.fromJson(response.data);
//     return weatherModel;
//   }
// }
