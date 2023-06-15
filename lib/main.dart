import 'package:zuzu/configs/index.dart';
import 'package:zuzu/controller/app_settings_controller.dart';
import 'package:zuzu/controller/app_version_controller.dart';
import 'package:zuzu/http/index.dart';
import 'package:zuzu/lang/local_string.dart';
import 'package:zuzu/routes/pages.dart';
import 'package:zuzu/routes/routes.dart';
import 'package:zuzu/themes/themes.dart';
import 'package:zuzu/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zuzu/widgets/app_report.dart';
import 'package:zuzu/widgets/app_tag.dart';
import 'package:zuzu/widgets/app_toast.dart';

Future<void> main() async {

  AppTag.initTag();

  AppHttp.init(
    options: BaseOptions(
      baseUrl: AppConfigs.apiUrl,
      headers: {'Accept': 'application/json'},
      validateStatus: (statusCode) {
        final codes = [100, 200, 400, 405, 500];

        return codes.contains(statusCode);
      },
    ),
    onRequest: (options, handler) async {
      // final token = await RcStorage.getValue(RcStorageKey.token);
      //
      // options.headers.addAll({
      //   'token': token,
      // });

      return handler.next(options);
    },
  );

  AppReport.init(
    dsn: AppConfigs.dsn,
    appRunner: () => runApp(const MyApp()),
  );

  // runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, child) => GetMaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: Themes().theme,
        initialBinding: InitialBinding(),
        navigatorKey: Get.key,
        initialRoute: Routes.splashScreen,
        getPages: Pages.list,
        translations: LocalString(),
        locale: const Locale('zh', 'CN'),
        builder: (context, widget) {
          ScreenUtil.init(context);
          AppToast.init(() => Get.overlayContext!);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          ); // Locking Device Orientation
        },
      ),
    );
  }
}

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppSettingsController>(AppSettingsController(), permanent: true);
    Get.put<AppVersionController>(AppVersionController(), permanent: true);
  }
}
