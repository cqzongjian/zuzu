/*
* @author: zongjian
* @createTime: 2023/6/15 09:28
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:zuzu/widgets/app_bottom_bar.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("discovery"),
      ),
      bottomNavigationBar: const AppBottomBar(),
    );
  }
}