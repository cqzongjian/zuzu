/*
* @author: zongjian
* @createTime: 2023/6/14 13:38
* @description: 
*/
import 'package:flutter/material.dart';

class AppGestureDetector extends StatelessWidget {
  const AppGestureDetector({
    Key? key,
    this.onTap,
    this.child,
    this.onDoubleTap,
  }) : super(key: key);

  final Widget? child;
  final void Function()? onTap;
  final void Function()? onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}
