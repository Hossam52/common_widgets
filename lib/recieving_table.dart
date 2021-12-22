import 'package:common_widgets/default_button.dart';
import 'package:common_widgets/signature.dart';
import 'package:common_widgets/table_data_widget.dart';
import 'package:flutter/material.dart';

//////////////////Concrete class for template/////////////////
class RecievingTableWidget extends StatelessWidget {
  const RecievingTableWidget(
      {Key? key,
      required this.tableData,
      this.onConfirmPressed,
      required this.onPayInvoicePressed,
      required this.time})
      : super(key: key);
  final List<TableRowItem> tableData;
  final VoidCallback? onConfirmPressed;
  final VoidCallback onPayInvoicePressed;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableDataWidget(rows: tableData),
        _payInvoice(),
        const SizedBox(height: 8),
        SignatureWidget(
          onConfirmPressed: onConfirmPressed,
        )
      ],
    );
  }

  Widget _payInvoice() {
    return Builder(builder: (context) {
      return Row(
        children: [
          Expanded(
            flex: 6,
            child: DefaultButton(
              background: Theme.of(context).primaryColor,
              onPressed: onPayInvoicePressed,
              text: 'Pay invoice',
              horizontalMargin: 0,
            ),
          ),
          Expanded(child: Container()),
          Flexible(
            flex: 9,
            child: Text(time,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).primaryColor,
                    )),
          )
        ],
      );
    });
  }
}
