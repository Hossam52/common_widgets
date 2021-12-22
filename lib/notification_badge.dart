import 'package:badges/badges.dart';
import 'package:common_widgets/build_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({Key? key, required this.onPressed, this.color})
      : super(key: key);
  final VoidCallback? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30.w),
      child: InkWell(
        onTap: onPressed,
        child: Badge(
          alignment: Alignment.topRight,
          badgeColor: Colors.red,
          badgeContent: Text(
            '1',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.white),
          ),
          position: BadgePosition(
            end: 5.w,
            top: -20.h,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: BuildIcon(
                path: 'assets/images/notification.png',
                package: 'common_widgets',
                size: 30.r,
                color: color ?? Theme.of(context).colorScheme.secondary),
          ),
        ),
      ),
    );
  }
}
