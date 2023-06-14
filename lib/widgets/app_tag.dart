/*
* @author: zongjian
* @createTime: 2023/6/14 09:29
* @description: 
*/
class AppTag {
  AppTag._();

  /// Tag标识
  static String tag = '';

  /// 创建Tag标识
  static initTag() {
    tag = DateTime.now().millisecondsSinceEpoch.toString();
  }

  /// 更新Tag标识
  static void updateTag() {
    tag = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
