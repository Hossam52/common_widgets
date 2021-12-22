import 'package:common_widgets/cancel_Item.dart';
import 'package:common_widgets/image_rounded.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget(
      {Key? key,
      this.isSelected,
      required this.imagePath,
      required this.title,
      this.bottom,
      this.delelteItemCallBack,
      this.width})
      : super(key: key);
  final bool? isSelected;
  final String imagePath;
  final String title;
  final Widget? bottom;
  final VoidCallback? delelteItemCallBack;
  late double? width;

  @override
  Widget build(BuildContext context) {
    width ??= (MediaQuery.of(context).size.width / 2.95);
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          children: [
            _data(),
            if (delelteItemCallBack != null)
              GestureDetector(
                onTap: delelteItemCallBack,
                child: const CancelItem(),
              )
          ],
        ),
      ),
    );
  }

  Card _data() {
    return Card(
      elevation: isSelected != null ? 0 : 4,
      color: isSelected != null && isSelected! ? const Color(0x21005BAA) : null,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Expanded(flex: 7, child: _image()),
            // Expanded(
            //   flex: 3,
            // child:
            _title(),
            // ),
            if (bottom != null) bottom!
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Builder(builder: (context) {
      return Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyText1,
      );
    });
  }

  RoundedImage _image() {
    return RoundedImage(
        width: double.infinity, height: double.infinity, imagePath: imagePath);
  }
}
