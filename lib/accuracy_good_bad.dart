import 'package:flutter/material.dart';

class AccuracyGoodBad extends StatelessWidget {
  const AccuracyGoodBad(
      {Key? key, required this.goodValue, required this.badValue})
      : super(key: key);
  final double goodValue;
  final double badValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      // height: 38.h,
      // width: 180.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        //color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: _accuracyValue(goodValue, 'Good', Colors.green)),
          const VerticalDivider(),
          Expanded(child: _accuracyValue(badValue, 'Bad', Colors.red)),
        ],
      ),
    );
  }

  Widget _accuracyValue(double value, String accuracyString, Color color) {
    return Builder(builder: (context) {
      final TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.w700,
            color: color,
          );
      return Column(
        children: [
          Text(
            accuracyString,
            style: style,
          ),
          Text('$goodValue %', style: style),
        ],
      );
    });
  }
}
