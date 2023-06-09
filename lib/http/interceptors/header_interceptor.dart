/*
* @author: zongjian
* @createTime: 2023/5/26 14:34
* @description: 
*/
import 'package:dio/dio.dart';

class HeaderInterceptors extends InterceptorsWrapper {

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    options.connectTimeout = const Duration(milliseconds: 600000); // 连接超时时间（毫秒
    options.receiveTimeout = const Duration(milliseconds: 600000); // 接收超时时间（毫秒）
    options.headers["Content-Type"] = 'application/json';
    options.headers["ACCEPT"] = 'application/json';
    return handler.next(options);
  }
}
