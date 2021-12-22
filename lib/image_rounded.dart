import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage(
      {Key? key,
      this.radius = 5,
      this.height,
      this.width,
      required this.imagePath})
      : super(key: key);
  final String imagePath;
  final double? height;
  final double? width;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.of(context).size.width / 3,
      width: width ?? MediaQuery.of(context).size.width / 3,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(radius!),
      //     image:
      //         DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius!),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
