/*
* @author: zongjian
* @createTime: 2023/6/21 13:28
* @description: 
*/
import 'package:get/get.dart';
import 'package:zuzu/controller/base/app_getx_controller.dart';
import 'package:zuzu/http/index.dart';
import 'package:zuzu/model/resp_model.dart';
import 'package:zuzu/routes/routes.dart';
import 'package:zuzu/utils/local_storage.dart';
import 'package:zuzu/utils/toast_message.dart';
import 'package:zuzu/widgets/app_report.dart';

class SettingsController extends AppGetxController {

  Future<void> logout() async {
    const String url = '/passport/logout';

    try {
      final Map<String, dynamic> data = {
        'userId': LocalStorage.getId()
      };

      final Map<String, dynamic> json = await AppHttp.post(
        url,
        data: data,
        cancelToken: cancelToken,
      );

      print(json);

      final Resp res = Resp.fromJson(json);

      if (res.code == 200) {
        LocalStorage.logout();
        Get.offAndToNamed(Routes.letsInScreen);
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