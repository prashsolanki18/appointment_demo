import 'dart:io';

import 'package:flutter/material.dart';

/// Common app image which handles assets and local file paths
class CommonAppImage extends StatelessWidget {
  final String imagePath;
  final BorderRadius radius;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;

  const CommonAppImage({
    Key? key,
    required this.imagePath,
    this.height,
    this.width,
    this.radius = BorderRadius.zero,
    this.fit = BoxFit.cover,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: radius),
      child: imagePath.contains('assets')
          ? Image.asset(
              imagePath,
              height: height,
              width: width,
              fit: fit,
              color: color,
            )
          : Image.file(
              File(imagePath),
              height: height,
              width: width,
              fit: fit,
            ),
    );
  }
}
