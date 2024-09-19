import 'package:flutter/material.dart';

import '../../../../../../../utils/export_link.dart';

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
            "theme_mode",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
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
