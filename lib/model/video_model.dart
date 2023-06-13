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
    message: Message.fromJson(json["message"]),
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
    isLastPage: json["isLastPage"] ?? true,
    list: json["list"] == null ? [] : List<VideoData>.from(json["list"].map((x) => VideoData.fromJson(x))),
  );
}

class VideoData {
  VideoData({
    required this.id,
    required this.like,
    required this.likeNumStr,
    required this.shareNumStr,
    required this.thumb,
    required this.title,
    required this.videoUrl,
    required this.likeNum,
    required this.collect,
    required this.collectNum,
  });

  final int id;
  bool like;
  int likeNum;
  final String likeNumStr;
  final String shareNumStr;
  final String thumb;
  final String title;
  final String videoUrl;
  bool collect;
  int collectNum;


  factory VideoData.fromJson(Map<String, dynamic> json) => VideoData(
    id: json["id"],
    like: json["like"],
    likeNumStr: json["likeNumStr"],
    shareNumStr: json["shareNumStr"],
    thumb: json["thumb"],
    title: json["title"],
    videoUrl: json["videoUrl"],
    likeNum: json["likeNum"],
    collect: json["collect"],
    collectNum: json["collectNum"],
  );
}