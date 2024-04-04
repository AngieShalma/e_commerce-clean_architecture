import 'package:dio/dio.dart';
import 'package:e_commerce_clean_architecture/core/utils/constants.dart';

class ApiManager{
 late Dio dio;
  ApiManager(){
    dio=Dio();
  }
 Future<Response>getData(String endpoint,{Map<String, dynamic>? param}){
    return dio.get(constants.baseURL+endpoint,queryParameters:param );
 }

 Future<Response>postData(String endpoint,{Map<String, dynamic>? body}){
   return dio.post(constants.baseURL+endpoint,data: body);
 }
}