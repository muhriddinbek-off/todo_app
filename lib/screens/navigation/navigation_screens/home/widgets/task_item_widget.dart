import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:todo_app/utils/app_size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskModel taskModel;
  final Function() onNextPage;
  const TaskItemWidget({
    super.key,
    required this.taskModel,
    required this.onNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onNextPage,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Row(
            children: [
              Icon(
                Icons.circle_outlined,
                color: Theme.of(context).disabledColor,
              ),
              10.getW(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: width * 0.35,
                        child: Text(
                          " ${DateFormat("dd MMMM hh:mm").format(DateTime(taskModel.dedline.year, taskModel.dedline.month, taskModel.dedline.day, taskModel.dedline.hour, taskModel.dedline.minute))}",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                      6.getW(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: AppColors.c4181CC,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          taskModel.category,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      6.getW(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(color: Theme.of(context).disabledColor),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.flag,
                              colorFilter: ColorFilter.mode(
                                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light ? AppColors.black : AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            8.getW(),
                            Text(
                              taskModel.priority.toString(),
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
