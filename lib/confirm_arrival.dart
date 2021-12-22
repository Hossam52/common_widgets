import 'package:common_widgets/default_button.dart';
import 'package:flutter/material.dart';

class ConfimrArrival extends StatelessWidget {
  const ConfimrArrival({Key? key, required this.arrivalTime}) : super(key: key);
  final String arrivalTime;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: DefaultButton(
            background: Theme.of(context).primaryColor,
            onPressed: () {},
            text: 'Confirm Arrival',
            horizontalMargin: 0,
          ),
        ),
        Expanded(child: Container()),
        Flexible(
          flex: 9,
          child: Text('Meeting time $arrivalTime',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColor,
                  )),
        )
      ],
    );
  }
}
