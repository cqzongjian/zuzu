/*
* @author: zongjian
* @createTime: 2023/6/15 17:13
* @description: 
*/
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:zuzu/configs/index.dart';
import 'package:zuzu/controller/base/app_getx_controller.dart';
import 'package:zuzu/http/index.dart';
import 'package:zuzu/model/version_model.dart';
import 'package:zuzu/widgets/app_report.dart';

class AppVersionController extends AppGetxController {
  static AppVersionController get to => Get.find<AppVersionController>();

  static const int updateVersion = 1;

  /// 版本号
  String version = '';

  /// 更新描述
  String describe = '';

  /// 更新链接
  String renewUrl = '';

  /// 获取版本信息
  Future<void> getVersion() async {
    const String url = '/appReleased/getLastVersion';

    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      String v = packageInfo.version;

      final Map<String, dynamic> params = {
        // 'type': GetPlatform.isAndroid ? 'a' : 'i',
        'appVersion': 'V$v'
      };

      final Map<String, dynamic> json = await AppHttp.get(
          url,
          params: params,
          cancelToken: cancelToken,
          isPrint: true
      );

      final VersionModel res = VersionModel.fromJson(json);

      if (res.message.code == '200') {
        version = res.data.version;
        renewUrl = res.data.downUrl;
        describe = res.data.updateMsg;

        update([updateVersion]);

        if (version.isNotEmpty && version != AppConfigs.appVersion) {
          Get.toNamed('/version');
        } else {
          // AppNoticeController.to.getSysNotice();
        }
      }
    } catch (e, t) {
      AppReport.modelError(
        url: url,
        e: e,
        t: t,
      );
    }
  }
}
