import 'package:common_widgets/default_button.dart';
import 'package:flutter/material.dart';

class SignatureWidget extends StatelessWidget {
  const SignatureWidget({Key? key, required this.onConfirmPressed})
      : super(key: key);
  final VoidCallback? onConfirmPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Signiture',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Flexible(
                child: DefaultButton(
              onPressed: null,
              // background: ColorManager.primaryOpacity70,
              text: 'Password',
              horizontalMargin: 0,
            )),
            SizedBox(width: 20),
            Flexible(
                child: DefaultButton(
              onPressed: onConfirmPressed,
              text: 'Confirm',
              background: Theme.of(context).primaryColor,
              horizontalMargin: 0,
            )),
            Expanded(flex: 1, child: Container()),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
