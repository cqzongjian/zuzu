/*
* @author: zongjian
* @createTime: 2023/6/14 09:21
* @description:
*/
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:zuzu/http/index.dart';
import 'package:zuzu/widgets/app_load.dart';
import 'package:zuzu/widgets/app_report.dart';

import 'app_getx_controller.dart';

enum HttpMethod {
  get,
  post,
}

abstract class AppGetxListController<T> extends AppGetxController {
  final RefreshController refreshController = RefreshController();

  int page = 1;
  bool isLast = false;
  bool isLoading = false;

  /// 是否初始化请求
  bool get isRequest => true;

  /// 列表数据
  List<T> list = [];

  /// 请求地址
  String get url;

  /// 是否打印
  bool get isPrint => false;

  /// 请求方式
  HttpMethod get httpMethod => HttpMethod.post;

  /// 参数扩展
  Map<String, dynamic> get paramsExtend => {};

  /// json格式化
  ResponseList<T> fromJson(Map<String, dynamic> json);

  @override
  void onInit() {
    super.onInit();

    if (isRequest) getList();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  Future<void> reload({bool showLoad = true}) async {
    if (showLoad) {
      setloadType(AppLoadType.load);
      await Future.delayed(const Duration(milliseconds: 300));
    }

    await getList();
  }

  Future<void> getList({bool isRefresh = true}) async {
    if (isRefresh) {
      page = 1;
      list = [];
      isLast = false;
    }

    if (isLoading) return;

    if (isLast) {
      refreshController.loadNoData();
      return;
    }

    isLoading = true;

    try {
      final Map<String, dynamic> params = {
        "pageSize": 10,
        "pageNumber": page
      };

      params.addAll(paramsExtend);
      print('=== 请求地址：$url');
      print('=== 请求参数：$params');
      final Map<String, dynamic> json = await AppHttp.post(
        url,
        data: params,
        isPrint: isPrint,
        cancelToken: cancelToken,
      );

      print('=== 请求响应：$json');
      final ResponseList<T> res = fromJson(json);

      if (res.code == "200") {
        list.addAll(res.list);

        if (res.isLast) {
          isLast = true;
        } else {
          page++;
        }

        setloadType(AppLoadType.success);
      }
    } catch (e, t) {
      setloadType(AppLoadType.error);
      AppReport.modelError(
        url: url,
        e: e,
        t: t,
      );
    } finally {
      isLoading = false;

      if (isRefresh) {
        refreshController.refreshCompleted();
        refreshController.resetNoData();
      } else {
        refreshController.loadComplete();
      }
    }
  }
}

class ResponseList<T> {
  const ResponseList({
    required this.code,
    required this.list,
    required this.isLast,
  });

  final String code;
  final bool isLast;
  final List<T> list;
}
