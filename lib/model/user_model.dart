/*
* @overview:
* @Author: rcc
* @Date: 2022-08-03 22:07:56
*/

import 'message_model.dart';

class UserModel {
  UserModel({
    required this.data,
    required this.message,
  });

  final UserData data;
  final Message message;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    data: json['data'] == null ? UserData.init() : UserData.fromJson(json['data']),
    message: Message.fromJson(json['message']),
  );
}

class UserData {
  UserData({
    required this.avatar,
    required this.codeCount,
    required this.collectCount,
    required this.email,
    required this.id,
    required this.phone,
    required this.sign,
    required this.username,
    required this.nickname,
    required this.refcode,
    required this.gold,
    required this.myFansCount,
    required this.myFollowCount,
    required this.myLikeCount,
  });

  final String avatar;
  final int codeCount;
  final int collectCount;
  final String email;
  final String id;
  final int gold;
  final String phone;
  final String sign;
  final String username;
  final String nickname;
  final String refcode;
  final String myFansCount;
  final String myFollowCount;
  final String myLikeCount;

  factory UserData.init() => UserData(
    avatar: '',
    codeCount: 0,
    collectCount: 0,
    email: '',
    id: '',
    phone: '',
    sign: '',
    username: '',
    nickname: '',
    refcode: '',
    gold: 0,
    myFansCount: '0',
    myFollowCount: '0',
    myLikeCount: '0',
  );

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    avatar: json['face'] ?? '',
    codeCount: json['codeCount'] ?? 0,
    collectCount: json['collectCount'] ?? 0,
    email: json['email'] ?? '',
    id: json['id'] ?? 0,
    gold: json['gold'] ?? 0,
    phone: json['mobile'] ?? '',
    sign: json['sign'] ?? '',
    username: json['username'] ?? '',
    nickname: json['nickname'] ?? '',
    refcode: json['refcode'] ?? '',
    myFansCount: json['myFansCount'] ?? '0',
    myFollowCount: json['myFollowsCount'] ?? '0',
    myLikeCount: json['totalLikeMeCount'] ?? '0',
  );
}
