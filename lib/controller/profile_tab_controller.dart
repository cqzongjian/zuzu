/*
* @author: zongjian
* @createTime: 2023/6/15 13:40
* @description: 
*/
import 'package:zuzu/controller/base/app_getx_list_controller.dart';
import 'package:zuzu/model/video_model.dart';

class ProfileTabController extends AppGetxListController<VideoData> {

  static const int updateVideo= 1;

  ProfileTabController(this.id);

  final int id;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Map<String, dynamic> get paramsExtend => {
    "categoryId": id
  };

  @override
  ResponseList<VideoData> fromJson(Map<String, dynamic> json) {
    final VideoModel res = VideoModel.fromJson(json);

    return ResponseList(
      code: res.message.code,
      list: res.data!.list,
      isLast: res.data!.isLastPage,
    );
  }

  @override
  String get url => '/videoInfoRandom';

  void onSearch() {
    reload();
    update([updateVideo]);
  }

}