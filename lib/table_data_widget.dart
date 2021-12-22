import 'package:flutter/material.dart';

class TableDataWidget extends StatelessWidget {
  const TableDataWidget(
      {Key? key, required this.rows, this.titleSize = 3, this.valueSize = 3})
      : super(key: key);
  final List<TableRowItem> rows;
  final double titleSize, valueSize;
  @override
  Widget build(BuildContext context) {
    return _orderData();
  }

  Widget _orderData() {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
            columnWidths: {
              0: FlexColumnWidth(titleSize),
              1: FlexColumnWidth(valueSize),
            },
            border: TableBorder(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
                horizontalInside:
                    BorderSide(color: Colors.grey.withOpacity(0.2))),
            children:
                rows.map((e) => _orderRowTableWidget(e, context)).toList()),
      );
    });
  }

  TableRow _orderRowTableWidget(TableRowItem rowItem, BuildContext context) {
    // final style = getSemiBoldStyle(
    //   fontSize: 19,
    // );
    final style = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontWeight: FontWeight.bold);
    final padding = const EdgeInsets.all(10);
    return TableRow(
      children: [
        Padding(
          padding: padding,
          child: Text(
            rowItem.title,
            style: style,
          ),
        ),
        Padding(padding: padding, child: Center(child: rowItem.widget)),
      ],
    );
  }
}

class TableRowItem {
  String title;
  Widget widget;
  Color rowColor;
  TableRowItem(
      {required this.title,
      required this.widget,
      this.rowColor = Colors.black});
}
