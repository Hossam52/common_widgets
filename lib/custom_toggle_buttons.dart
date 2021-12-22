import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToggleButtons extends StatefulWidget {
  // final List<String> tabs;
  final List<ToggleItemData> tabs;
  final int selectedIndex;
  late List<bool> selected;
  final double? minWidth;
  final Color backgroundColor;
  CustomToggleButtons(
      {Key? key,
      this.selectedIndex = 0,
      required this.tabs,
      this.minWidth,
      this.backgroundColor = Colors.white})
      : super(key: key) {
    selected = List.filled(tabs.length, false);
    selected[selectedIndex] = true;
  }

  @override
  _CustomToggleButtonsState createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final tabsLength = widget.tabs.length;
    final toggleWidth = widget.minWidth ?? (width - 40) / tabsLength;
    return Material(
      elevation: 5,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(10)),
        child: ToggleButtons(
          borderRadius: BorderRadius.circular(10),
          fillColor: Theme.of(context).colorScheme.secondary,
          color: Colors.black,
          constraints: BoxConstraints(
            minWidth: widget.minWidth != null ? toggleWidth : 0,
            // maxHeight: 60,
            maxWidth: widget.minWidth != null ? double.infinity : toggleWidth,
          ),
          // constraints:
          //     BoxConstraints(maxWidth: (MediaQuery.of(context).size.width - 40)) /
          //         widget.tabs.length.toDouble(),
          children: widget.tabs.map((e) => _buildTabItem(e.title)).toList(),
          isSelected: widget.selected,
          selectedColor: Colors.white,
          onPressed: (index) {
            widget.tabs[index].onPressed();
            setState(() {
              widget.selected.setAll(
                  0, List.generate(widget.selected.length, (index) => false));
              widget.selected[index] = true;
            });
          },
        ),
      ),
    );
  }

  Widget _buildTabItem(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 13.sp),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class ToggleItemData {
  final String title;
  final VoidCallback onPressed;
  ToggleItemData({required this.title, required this.onPressed});
}

class ToggleItemDataWithWidget extends ToggleItemData {
  final Widget page;
  ToggleItemDataWithWidget(
      {required String title,
      required VoidCallback onPressed,
      required this.page})
      : super(title: title, onPressed: onPressed);
}
