/*
* @author: zongjian
* @createTime: 2023/6/15 13:41
* @description: 
*/
class Video {
  Video({
    required this.actorId,
    required this.categoryId,
    required this.collectNum,
    required this.commentNum,
    required this.createdAt,
    required this.duration,
    required this.id,
    required this.likeNum,
    required this.relateId,
    required this.score,
    required this.shareNum,
    required this.status,
    required this.tags,
    required this.thumb,
    required this.title,
    required this.type,
    required this.updatedAt,
    required this.url,
    required this.userId,
    required this.viewNum,
  });

  final int actorId;
  final int categoryId;
  final int collectNum;
  final int commentNum;
  final int createdAt;
  final String duration;
  final int id;
  final int likeNum;
  final int relateId;
  final double score;
  final int shareNum;
  final bool status;
  final String tags;
  final String thumb;
  final String title;
  final String type;
  final int updatedAt;
  final String url;
  final int userId;
  final int viewNum;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    actorId: json['actorId'],
    categoryId: json['categoryId'],
    collectNum: json['collectNum'],
    commentNum: json['commentNum'],
    createdAt: json['createdAt'],
    duration: json['duration'],
    id: json['id'],
    likeNum: json['likeNum'],
    relateId: json['relateId'],
    score: json['score'].toDouble(),
    shareNum: json['shareNum'],
    status: json['status'],
    tags: json['tags'],
    thumb: json['thumb'],
    title: json['title'],
    type: json['type'],
    updatedAt: json['updatedAt'],
    url: json['url'],
    userId: json['userId'],
    viewNum: json['viewNum'],
  );
}