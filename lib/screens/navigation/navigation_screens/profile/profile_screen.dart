import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/cubit/initial_value/initial_value_cubit.dart';
import 'package:todo_app/cubit/initial_value/initial_value_state.dart';
import 'package:todo_app/data/local/shared_preferenses_storage.dart';
import 'package:todo_app/screens/navigation/navigation_screens/profile/widget/change_user_name.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_constanta.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:todo_app/utils/app_size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocBuilder<InitialValueCubit, InitialValueState>(
          builder: (context, state) {
            return SizedBox(
              height: height,
              width: width,
              child: Column(
                children: [
                  Text(
                    "Profile",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  16.getH(),
                  CircleAvatar(
                    radius: 50.h,
                    child: SvgPicture.asset(
                      AppIcons.user,
                      height: 50.h,
                    ),
                  ),
                  16.getH(),
                  Text(
                    StorageRepository.getString(key: AppConstanta.fullName),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  30.getH(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Settings",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      getUserInfoItem(context, AppIcons.settings, "App Settings", () {}),
                      16.getH(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Account",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      getUserInfoItem(context, AppIcons.user, "Change account name", () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ChangeUserName(
                              onFirst: (value) {},
                              onLast: (value) {},
                            );
                          },
                        );
                      }),
                      16.getH(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Uptodo",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      getUserInfoItem(context, AppIcons.logout, "Log out", () {}),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getUserInfoItem(BuildContext context, String iconName, String title, Function() func) {
    return ListTile(
      onTap: func,
      leading: SvgPicture.asset(
        iconName,
        colorFilter: ColorFilter.mode(
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light ? AppColors.black : AppColors.white,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.navigate_next_rounded)),
    );
  }
}
