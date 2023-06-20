/*
* @author: zongjian
* @createTime: 2023/6/13 17:38
* @description: 
*/
import 'message_model.dart';

class VideoModel {
  VideoModel({
    required this.data,
    required this.message,
  });

  final Data data;
  final Message message;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    message: Message.fromJson(json),
    data: json["data"] == null ? Data(isLastPage: true, list: []) : Data.fromJson(json["data"]),
  );
}

class Data {
  Data({
    required this.isLastPage,
    required this.list,
  });

  final bool isLastPage;
  final List<VideoData> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isLastPage: json["current"] == json["pages"],
    list: json["records"] == null ? [] : List<VideoData>.from(json["records"].map((x) => VideoData.fromJson(x))),
  );
}

class VideoData {
  VideoData({
    required this.vlogId,
    required this.vloggerId,
    required this.vloggerName,
    required this.vloggerFace,
    required this.like,
    required this.likeNum,
    required this.shareNum,
    required this.cover,
    required this.title,
    required this.url,
    required this.collect,
    required this.collectNum,
    required this.commentsCount,
  });

  final String vlogId;
  final String vloggerId;
  final String vloggerName;
  final String vloggerFace;
  bool like;
  int likeNum;
  final int shareNum;
  final String cover;
  final String title;
  final String url;
  bool collect;
  int collectNum;
  int commentsCount;


  factory VideoData.fromJson(Map<String, dynamic> json) => VideoData(
    vlogId: json["vlogId"],
    vloggerId: json["vloggerId"],
    vloggerName: json["vloggerName"],
    vloggerFace: json["vloggerFace"],
    like: json["like"] ?? false,
    likeNum: json["likeNum"] ?? 0,
    shareNum: json["shareNum"] ?? 0,
    cover: json["cover"],
    title: json["title"],
    url: json["url"],
    collect: json["collect"] ?? false,
    collectNum: json["collectNum"] ?? 0,
    commentsCount: json["commentsCount"] ?? 0,
  );
}