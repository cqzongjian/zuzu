/*
* @author: zongjian
* @createTime: 2023/6/14 11:00
* @description: 
*/
import 'dart:async';
import 'package:logger/logger.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

class AppReport {
  AppReport._();

  static final Logger _logger = Logger();

  /// 是否上报
  static bool _isReport = false;

  /// 上报初始化
  static Future<void> init({
    required String dsn,
    required FutureOr<void> Function() appRunner,
    bool isReport = false,
  }) async {
    _isReport = isReport;

    appRunner.call();
    // await SentryFlutter.init(
    //       (options) {
    //     options.dsn = dsn;
    //     options.tracesSampleRate = 1;
    //   },
    //   appRunner: appRunner,
    // );
  }

  /// TryCatch错误
  static void tryError({
    required dynamic e,
    required String tag,
    required StackTrace t,
  }) {
    final tags = 'TryCatch错误:$tag';

    _logger.e(tags, e, t);
    _sentryReport(tag: tags, e: e, t: t);
  }

  /// 模型错误
  static void modelError({
    required dynamic e,
    required String url,
    required StackTrace t,
  }) {
    final tags = '模型错误:$url';

    _logger.e(tags, e, t);
    _sentryReport(tag: tags, e: e, t: t);
  }

  /// sentry上报
  static void _sentryReport({
    required dynamic e,
    required String tag,
    required StackTrace t,
  }) {
    if (!_isReport) return;

    try {
      final throwable = '''
        -------- **** --------
        tags : $tag;
        -------- **** --------
        error : ${e.toString()};
      ''';

      // Sentry.captureException(throwable, stackTrace: t);
    } catch (_) {}
  }
}