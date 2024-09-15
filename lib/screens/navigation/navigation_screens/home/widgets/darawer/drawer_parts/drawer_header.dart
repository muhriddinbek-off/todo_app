import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/data/local/shared_preferenses_storage.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_constanta.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:todo_app/utils/app_size.dart';

class DrawerHeaderPart extends StatelessWidget {
  const DrawerHeaderPart({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.c9741CC,
            radius: 30.r,
            child: SvgPicture.asset(AppIcons.user),
          ),
          10.getH(),
          Text(
            StorageRepository.getString(key: AppConstanta.fullName),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
