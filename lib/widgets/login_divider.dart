/*
* @author: zongjian
* @createTime: 2023/6/12 14:45
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginDivider extends StatelessWidget {

  final String text;

  const LoginDivider({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Divider(color: Theme.of(context).colorScheme.onSecondary,),),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(text),
        ),
        Expanded(child: Divider(color: Theme.of(context).colorScheme.onSecondary,),),
      ],
    );
  }
}