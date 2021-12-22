import 'package:flutter/material.dart';

class CounterButtons extends StatefulWidget {
  final void Function(int) onCounterChange;
  const CounterButtons(
      {Key? key,
      required this.onCounterChange,
      this.maxVal = 10,
      this.minVal = 1})
      : super(key: key);
  final maxVal;
  final minVal;

  @override
  _CounterButtonsState createState() => _CounterButtonsState();
}

class _CounterButtonsState extends State<CounterButtons> {
  int _counter = 1;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.21,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                  child: InkWell(
                    onTap: _counter == widget.minVal ? null : _decrement,
                    child: const Icon(
                      Icons.remove,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    _counter.toString(),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  child: InkWell(
                    onTap: _counter == widget.maxVal ? null : _increment,
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  void _increment() {
    setState(() {
      _counter++;
      widget.onCounterChange(_counter);
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
      widget.onCounterChange(_counter);
    });
  }
}
