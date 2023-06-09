/*
* @author: zongjian
* @createTime: 2023/5/26 14:34
* @description: 
*/
import 'package:dio/dio.dart';
import 'package:zuzu/utils/local_storage.dart';

class TokenInterceptors extends InterceptorsWrapper {

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    options.headers["Authorization"] = 'Bearer ${LocalStorage.getToken()}';
    options.headers["Client-Type"] = 'user:';
    return handler.next(options);
  }
}
