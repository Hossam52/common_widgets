import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildIcon extends StatelessWidget {
  const BuildIcon(
      {Key? key, required this.path, this.size, this.color, this.package})
      : super(key: key);
  final String path;
  final double? size;
  final Color? color;
  final String? package;
  @override
  Widget build(BuildContext context) {
    final double iconSize = size ?? 16.w;
    return Builder(builder: (context) {
      return Image.asset(
        path,
        width: iconSize,
        height: iconSize,
        color: color,
        package: package,
      );
    });
  }
}
