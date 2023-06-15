/*
* @author: zongjian
* @createTime: 2023/6/15 17:13
* @description:
*/
import 'message_model.dart';

class VersionModel {
  VersionModel({
    required this.data,
    required this.message,
  });

  final Data data;
  final Message message;

  factory VersionModel.fromJson(Map<String, dynamic> json) => VersionModel(
        data: json["data"] == null ? Data.init() : Data.fromJson(json["data"]),
        message: Message.fromJson(json["message"]),
      );
}

class Data {
  Data({
    required this.downUrl,
    required this.updateMsg,
    required this.version,
  });

  final String downUrl;
  final String updateMsg;
  final String version;

  factory Data.init() => Data(
        version: '',
        downUrl: '',
        updateMsg: '',
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        downUrl: json["appDownUrl"] ?? '',
        updateMsg: json["appUpgradeContent"] ?? '',
        version: json["appVersion"] ?? '',
      );
}
