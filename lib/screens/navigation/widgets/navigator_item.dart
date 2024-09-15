import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/utils/app_size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NavigatorItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onChangeIndex;
  const NavigatorItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onChangeIndex,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(Theme.of(context).disabledColor, BlendMode.srcIn),
          ),
          6.getH(),
          Text(title, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}
