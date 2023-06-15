/*
* @author: zongjian
* @createTime: 2023/6/15 09:28
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:zuzu/widgets/app_bottom_bar.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("inbox"),
      ),
      bottomNavigationBar: const AppBottomBar(),
    );
  }
}