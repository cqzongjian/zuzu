/*
* @author: zongjian
* @createTime: 2023/6/15 13:35
* @description: 
*/
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:zuzu/widgets/app_empty.dart';


class AppGridView extends StatelessWidget {
  const AppGridView({
    Key? key,
    required this.itemCount,
    required this.controller,
    required this.itemBuilder,
    required this.crossAxisCount,
    this.padding,
    this.onLoad,
    this.onRefresh,
    this.mainAxisSpacing = 0,
    this.crossAxisSpacing = 0,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int? itemCount;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final RefreshController controller;
  final FutureOr<dynamic> Function()? onLoad;
  final FutureOr<dynamic> Function()? onRefresh;
  final Widget Function(BuildContext, int) itemBuilder;

  final EdgeInsetsGeometry? padding;

  bool get isEmpty => itemCount == null || itemCount == 0;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      onLoading: onLoad,
      enablePullDown: true,
      enablePullUp: !isEmpty,
      onRefresh: onRefresh,
      header: const WaterDropHeader(
          complete: Text('加载完成')
      ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode){
          Widget body ;
          if(mode==LoadStatus.idle){
            body =  const Text("上拉加载更多");
          }
          else if(mode==LoadStatus.loading){
            body =  const CupertinoActivityIndicator();
          }
          else if(mode == LoadStatus.failed){
            body = const Text("加载失败");
          }
          else if(mode == LoadStatus.canLoading){
            body = const Text("松开后开始加载");
          }
          else{
            body = const Text("没有更多啦");
          }
          return SizedBox(
            height: 55.0,
            child: Center(child:body),
          );
        },
      ),
      controller: controller,
      child: isEmpty ? const AppEmpty() : _buildList(),
    );
  }

  Widget _buildList() {
    return GridView.builder(
      padding: padding,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
    );
  }
}
