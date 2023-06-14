/*
* @author: zongjian
* @createTime: 2023/6/14 13:52
* @description: 
*/
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {

  const AppImage(this.path, {
    Key? key,
    this.width,
    this.height,
    this.color,
    this.radius,
  }) : super(key: key);

  final String path;
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;
  final svgLastChars = '.svg';
  final httpChars = 'http';

  @override
  Widget build(BuildContext context) {
    if (path.endsWith(svgLastChars)) {
      return SvgPicture.asset(
          path,
          colorFilter: color != null ?
            ColorFilter.mode(color!, BlendMode.srcIn) : null,
          width: width,
          height: height
      );
    }
    if (path.startsWith(httpChars)) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(radius??0),
          child: CachedNetworkImage(
            imageUrl: path,
            width: width,
            height: height,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
      );
    }
    return Image.asset(path, width: width, height: height,);
  }
}