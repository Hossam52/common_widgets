import 'package:common_widgets/build_icon.dart';
import 'package:common_widgets/table_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<TableRowItem> invoiceData({
  required String id,
  required double discount,
  required double commission,
  required double totalPrice,
  bool showPaymentMethod = true,
}) {
  return [
    TableRowItem(title: 'Order number', widget: Text('#$id')),
    TableRowItem(title: 'Discount', widget: Text('$discount')),
    TableRowItem(title: 'Order commision', widget: Text('$commission JD')),
    TableRowItem(title: 'Total order price', widget: Text('$totalPrice JD')),
    if (showPaymentMethod)
      TableRowItem(
          title: 'Payment method',
          widget: BuildIcon(
            path: 'assets/images/cash.png',
            size: 30.r,
            package: 'common_widgets',
          )),
  ];
}
