/*
* @overview: 
* @Author: rcc 
* @Date: 2022-08-03 22:08:29 
*/

class Message {
  Message({
    required this.message,
    required this.code,
  });

  final String message;
  final int code;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    message: json['message'] ?? '',
    code: json['code'] ?? 400,
  );
}
