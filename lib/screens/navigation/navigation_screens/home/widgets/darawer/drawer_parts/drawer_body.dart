import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DrawerBodyWidget extends StatelessWidget {
  final Function() changeTheme;
  const DrawerBodyWidget({
    super.key,
    required this.changeTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "Theme Mode",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: ZoomTapAnimation(
            onTap: changeTheme,
            child: SvgPicture.asset(
              AppIcons.theme,
              height: 18.h,
              colorFilter: ColorFilter.mode(
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light ? AppColors.black : AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
