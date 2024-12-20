import 'package:dio/dio.dart';

class Dioservices {
  static final dio=Dio(

    BaseOptions(
      baseUrl: 'http://10.0.2.2:5001',
      )
  );
}
