import 'package:dio/dio.dart';
import '../utils/constants.dart';

class DioHelper {
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.BASE_URL,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type' :'application/json',
        }
      ),

    );
  }

  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    return await dio.post(
        path,
        data: data,
        queryParameters: query);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query}) async
  {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query}) async
  {
    return await dio.delete(url, queryParameters: query, data: data);
  }

  static Future<Response> updateData({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    return await dio.patch(
        path,
        data: data,
        queryParameters: query);
  }
}