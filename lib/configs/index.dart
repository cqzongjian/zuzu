/*
* @author: zongjian
* @createTime: 2023/6/14 10:52
* @description: 
*/
class AppConfigs {
  AppConfigs._();

  /// App环境
  static const Env appEnv = Env.develop;

  /* -------- 版本配置  -------- */

  /// App版本号
  static const String appVersion = '1.0.0';

  /// App名称
  static const String appName = 'zuzu';

  /// App应用名
  static const String applicationName = 'com.example.zuzu';

  /// API请求地址
  static final String apiUrl = appEnv.apiUrl;

  /// sentry DSN
  static const String dsn = '';
}

enum Env {
  /// 开发环境
  develop(
    // apiUrl: 'https://mock.apifox.cn/m1/2875643-0-default',
    apiUrl: 'http://192.168.10.12:8099'
  ),

  /// 内测环境
  alpha(
    apiUrl: '',
  ),

  /// 外测环境
  beta(
    apiUrl: '',
  ),

  /// 生产环境
  produce(
    apiUrl: '',
  );

  final String apiUrl;

  const Env({
    required this.apiUrl,
  });
}
