import 'package:common_widgets/custom_toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines/timelines.dart';

class DeliveryMonaolaPage extends StatefulWidget {
  DeliveryMonaolaPage(
      {Key? key,
      required this.deliveryWidget,
      required this.monaolaWidget,
      this.intialSelected = OrderRecievingType.Delivery})
      : super(key: key);
  final Widget deliveryWidget;
  final Widget monaolaWidget;
  final OrderRecievingType intialSelected;
  @override
  State<DeliveryMonaolaPage> createState() => _DeliveryMonaolaPageState();
}

class _DeliveryMonaolaPageState extends State<DeliveryMonaolaPage> {
  @override
  void initState() {
    selectedDeliveryTypeIndex = widget.intialSelected.index;
    recieveOrdersTypeTaps = [
      ToggleItemDataWithWidget(
          title: 'Delivery',
          onPressed: () => onChangeDeliveryType(0),
          page: widget.deliveryWidget),
      ToggleItemDataWithWidget(
          title: 'Monaola',
          onPressed: () => onChangeDeliveryType(1),
          page: widget.monaolaWidget),
    ];
    super.initState();
  }

  late List<ToggleItemDataWithWidget> recieveOrdersTypeTaps;
  late int selectedDeliveryTypeIndex;
  void onChangeDeliveryType(int index) {
    setState(() {
      selectedDeliveryTypeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomToggleButtons(
            tabs: recieveOrdersTypeTaps,
            selectedIndex: selectedDeliveryTypeIndex,
          ),
          SizedBox(height: 8),
          recieveOrdersTypeTaps[selectedDeliveryTypeIndex].page,
        ],
      ),
    );
  }
}

enum OrderRecievingType { Delivery, Monaola }
