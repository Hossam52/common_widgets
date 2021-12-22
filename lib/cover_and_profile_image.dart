import 'package:flutter/material.dart';

class CoverProfileImage extends StatelessWidget {
  const CoverProfileImage({
    Key? key,
    required this.coverImagePath,
    required this.profileImagePath,
    this.totalHeight = 300,
    this.radius = 70,
    this.startWidget,
    this.endWidget,
    this.changeProfilePictures = false,
    this.id,
    this.onChangeCoverPicture,
    this.onChangePersonalPicture,
  }) : super(key: key);
  final String coverImagePath;
  final String profileImagePath;
  final double totalHeight;
  final double radius;

  final Widget? startWidget;
  final Widget? endWidget;
  final bool changeProfilePictures;
  final String? id;

  final VoidCallback? onChangeCoverPicture;
  final VoidCallback? onChangePersonalPicture;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: totalHeight,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _coverImage(),
            _personalImage(),
            _rightAction(),
            _leftAction(),
          ],
        ),
      ),
    );
  }

  Widget _personalImage() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Builder(builder: (context) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: radius,
              backgroundImage: AssetImage(profileImagePath),
            ),
            if (onChangePersonalPicture != null)
              CircleAvatar(
                radius: radius * 0.3,
                backgroundColor: Theme.of(context).primaryColor,
                child: InkWell(
                  onTap: onChangePersonalPicture,
                  child: Icon(
                    Icons.camera_alt,
                    size: radius * 0.4,
                    color: Colors.white,
                  ),
                ),
              )
          ],
        );
      }),
    );
  }

  Widget _coverImage() {
    return Container(
      width: double.infinity,
      height: totalHeight, // totalHeight - radius,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: totalHeight - radius,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(coverImagePath),
                ),
              ),
            ),
          ),
          if (onChangeCoverPicture != null) _changeCoverButton(),
          if (id != null) _idContainer(),
        ],
      ),
    );
  }

  Widget _changeCoverButton() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Builder(builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: radius * 2,
          width: MediaQuery.of(context).size.width * 0.3,
          child: FittedBox(
            child: ElevatedButton(
              child: Row(
                children: [
                  Text('Change cover'),
                  SizedBox(width: 5),
                  Icon(Icons.camera_alt),
                ],
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: onChangeCoverPicture,
            ),
          ),
        );
      }),
    );
  }

  Widget _idContainer() {
    final double buttonHeight = 30;
    return Positioned(
      bottom: radius - (buttonHeight / 2),
      right: 0,
      child: Builder(builder: (context) {
        return FittedBox(
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width * 0.25,
            height: buttonHeight,
            child: Center(
              child: FittedBox(
                child: Text(
                  id!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _rightAction() {
    if (startWidget != null) {
      return Align(
        alignment: Alignment.bottomRight,
        child: startWidget,
      );
    }
    return Container();
  }

  Widget _leftAction() {
    if (endWidget != null)
      return Align(
        alignment: Alignment.bottomLeft,
        child: endWidget,
      );
    return Container();
  }
}
