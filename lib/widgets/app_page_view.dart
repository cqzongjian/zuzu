/*
* @author: zongjian
* @createTime: 2023/6/14 13:33
* @description: 
*/
import 'package:flutter/material.dart';

class AppPageView extends StatefulWidget {
  const AppPageView({
    Key? key,
    required this.onLoad,
    required this.onRefresh,
    required this.itemCount,
    required this.itemBuilder,
    required this.onPageChanged,
  }) : super(key: key);

  final int itemCount;

  final Future<void> Function() onLoad;
  final Future<void> Function() onRefresh;

  final void Function(int) onPageChanged;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  AppPageViewState createState() => AppPageViewState();
}

class AppPageViewState extends State<AppPageView> {
  final PageController controller = PageController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    addListener();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void addListener() {
    controller.addListener(() async {
      final bool isNotLoading = !isLoading;
      final bool isLast = controller.position.pixels == controller.position.maxScrollExtent;

      if (isLast && mounted && isNotLoading) {
        isLoading = true;

        await widget.onLoad();

        isLoading = false;
      }
    });
  }

  Future<void> onRefresh() async {
    if (isLoading) return;
    isLoading = true;
    await widget.onRefresh();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: PageView.builder(
        controller: controller,
        itemCount: widget.itemCount,
        scrollDirection: Axis.vertical,
        itemBuilder: widget.itemBuilder,
        onPageChanged: widget.onPageChanged,
      ),
    );
  }
}
