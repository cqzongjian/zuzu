/*
* @overview: 
* @Author: rcc 
* @Date: 2022-08-03 22:08:29 
*/

class Message {
  Message({
    required this.msg,
    required this.code,
  });

  final String msg;
  final String code;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        msg: json['msg'] ?? '',
        code: json['code'] ?? '400',
      );
}
