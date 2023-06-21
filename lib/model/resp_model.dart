/*
* @author: zongjian
* @createTime: 2023/6/20 11:24
* @description: 
*/
class Resp<T> {
  Resp({
    required this.success,
    required this.message,
    required this.code,
    this.data,
  });

  final bool success;
  final String message;
  final int code;
  final T? data;

  factory Resp.fromJson(Map<String, dynamic> json) => Resp(
    success: json['success'] ?? false,
    message: json['message'] ?? '',
    code: json['code'] ?? 400,
    data: json['data']
  );
}