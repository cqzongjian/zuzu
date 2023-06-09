/*
* @author: zongjian
* @createTime: 2023/05/26 14:33
* @description: 日志打印
*/
import 'package:logger/logger.dart';

class AppLog {
  AppLog._();

  static final Logger _logger = Logger();

  static void i(
      dynamic message, [
        String? tag,
        StackTrace? t,
      ]) {
    _logger.i(message, tag, t);
  }

  static void e(
      String tag, [
        dynamic e,
        StackTrace? t,
      ]) {
    _logger.e(tag, e, t);
  }
}
