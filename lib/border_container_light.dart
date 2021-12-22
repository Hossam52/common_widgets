import 'package:flutter/material.dart';

class BorderContainerLight extends StatelessWidget {
  const BorderContainerLight({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Theme.of(context).primaryColor, width: 0.2),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: 3,
            ),
          ]),
      child: child,
    );
  }
}
