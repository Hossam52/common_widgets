import 'package:common_widgets/border_container_light.dart';
import 'package:common_widgets/cover_and_profile_image.dart';
import 'package:common_widgets/notification_badge.dart';
import 'package:common_widgets/table_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStructure extends StatelessWidget {
  const ProfileStructure({Key? key, required this.profileData})
      : super(key: key);

  final ProfileDataConfigs profileData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CoverProfileImage(
            onChangeCoverPicture: profileData.onChangeCoverPicture,
            onChangePersonalPicture: profileData.onChangePersonalPicture,
            id: profileData.profileId,
            endWidget: profileData.showBackButton
                ? BackButton(
                    color: Theme.of(context).primaryColor,
                  )
                : Container(),
            startWidget: profileData.onNotificationPressed != null
                ? NotificationBadge(
                    onPressed: profileData.onNotificationPressed,
                    color: profileData.notificationColor,
                  )
                : Container(),
            coverImagePath: profileData.coverImagePath,
            profileImagePath: profileData.imagePath,
            totalHeight: 200.h,
            radius: 60.r,
          ),
          const SizedBox(height: 20),
          Text(profileData.title ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: profileData.titleColor)),
          TableDataWidget(
            rows: profileData.detailsTable,
            titleSize: profileData.tableTitleSizeFactor,
            valueSize: profileData.tableValueSizeFactor,
          ),
          if (profileData.showDiscription) _storeDescription()
        ],
      ),
    );
  }

  Widget _storeDescription() {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Store description',
                style: Theme.of(context).textTheme.bodyText2),
            Container(
              padding: const EdgeInsets.all(10),
              constraints: const BoxConstraints(minHeight: 100),
              child: BorderContainerLight(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Hello This is description for the store hossam',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

class ProfileDataConfigs {
  final String? title;
  final List<TableRowItem> detailsTable;
  final String coverImagePath;
  final String imagePath;
  final bool showDiscription;
  final VoidCallback? onNotificationPressed;
  final bool showBackButton;
  final double tableTitleSizeFactor;
  final double tableValueSizeFactor;
  final String? profileId;
  final Color? titleColor;
  final Color? notificationColor;
  final VoidCallback? onChangeCoverPicture;
  final VoidCallback? onChangePersonalPicture;

  ProfileDataConfigs(
      {this.title,
      required this.detailsTable,
      required this.coverImagePath,
      required this.imagePath,
      this.profileId,
      this.showDiscription = true,
      this.showBackButton = true,
      this.onNotificationPressed,
      this.tableTitleSizeFactor = 3,
      this.tableValueSizeFactor = 3,
      this.titleColor,
      this.notificationColor,
      this.onChangeCoverPicture,
      this.onChangePersonalPicture});
}
