/*
* @overview: 
* @Author: zongjian
* @Date: 2022-08-16 22:41:42 
*/
class SortData {
  SortData({
    required this.id,
    required this.name,
    required this.icon,
  });

  final int id;
  final String name;
  final String icon;

  factory SortData.fromJson(Map<String, dynamic> json) => SortData(
    id: json['id'],
    name: json['name'],
    icon: json['icon'],
  );
}
