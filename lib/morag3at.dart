import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_widgets/border_container_light.dart';
import 'package:common_widgets/morag3at_model.dart';
import 'package:common_widgets/rating_row.dart';

class Morag3atWidget extends StatelessWidget {
  const Morag3atWidget(
      {Key? key, required this.morg3at, this.fillColor = Colors.amber})
      : super(key: key);
  final List<Morag3atModel> morg3at;
  final Color fillColor;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: morg3at.length,
        itemBuilder: (_, index) => _ReviewItem(morg3at[index]));
  }
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem(this.morg3atItem, {Key? key, this.fillColor = Colors.amber})
      : super(key: key);
  final Morag3atModel morg3atItem;
  final Color fillColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
      child: BorderContainerLight(
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: _personImage(),
                ),
                Expanded(flex: 4, child: _reviewData())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _personImage() {
    return FittedBox(
      child: CircleAvatar(
        backgroundImage: AssetImage(morg3atItem.imagePath),
      ),
    );
  }

  Widget _reviewData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _nameAndDate(),
          _ratingIndicator(),
          _discription(),
          _time(),
        ],
      ),
    );
  }

  Widget _nameAndDate() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(morg3atItem.name, style: Theme.of(context).textTheme.bodyText2),
          Text(morg3atItem.date,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Theme.of(context).primaryColor)),
        ],
      );
    });
  }

  Widget _ratingIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RatingRow(
        size: 18.w,
        color: fillColor,
      ),
    );
  }

  Widget _discription() {
    return Builder(builder: (context) {
      return Text(morg3atItem.review,
          maxLines: 3,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText1);
    });
  }

  Widget _time() {
    return Builder(builder: (context) {
      return Align(
          alignment: Alignment.centerRight,
          child: Text(morg3atItem.time,
              style: Theme.of(context).textTheme.bodyText2));
    });
  }
}
