import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/cubit/navigation/navigation_cubit.dart';
import 'package:todo_app/cubit/navigation/navigation_state.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/screens/routes.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:todo_app/utils/app_size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DeleteTask extends StatelessWidget {
  final TaskModel taskModel;
  const DeleteTask({
    super.key,
    required this.taskModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: ZoomTapAnimation(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: SvgPicture.asset(
              AppIcons.cansel,
              colorFilter: ColorFilter.mode(
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light ? AppColors.black : AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle_outlined,
                      color: Theme.of(context).disabledColor,
                    ),
                    20.getW(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          taskModel.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        10.getH(),
                        SizedBox(
                          width: width * 0.7,
                          child: Text(
                            taskModel.description,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                30.getH(),
                taskInfo(context, AppIcons.timer, "Task Time", DateFormat("dd MMMM hh:mm").format(DateTime(taskModel.dedline.year, taskModel.dedline.month, taskModel.dedline.day, taskModel.dedline.hour, taskModel.dedline.minute))),
                30.getH(),
                taskInfo(context, AppIcons.tag, "Task Category", taskModel.category),
                30.getH(),
                taskInfo(context, AppIcons.flag, "Task Priority", taskModel.priority.toString()),
                30.getH(),
                ZoomTapAnimation(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          icon: Text(
                            "Delete Task",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          title: const Divider(),
                          content: Text(
                            "Are You sure you want to delete this task? Task title : ${taskModel.title}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          actions: [
                            SizedBox(
                              width: double.maxFinite,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                  ),
                                  Expanded(
                                    child: ZoomTapAnimation(
                                      onTap: () {
                                        context.read<NavigationCubit>().getDeleteTasksData(taskModel.id!);
                                        Navigator.pushNamedAndRemoveUntil(context, AppRouteName.navigationScreen, (context) => false);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
                                        decoration: BoxDecoration(
                                          color: AppColors.c8687E7,
                                          borderRadius: BorderRadius.circular(4.r),
                                        ),
                                        child: Text(
                                          "Delete",
                                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.delete,
                        colorFilter: ColorFilter.mode(
                          AppColors.aFF4949,
                          BlendMode.srcIn,
                        ),
                      ),
                      10.getW(),
                      Text(
                        'Delete Task',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.aFF4949),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget taskInfo(BuildContext context, String iconName, String taskName, String datetime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              iconName,
              colorFilter: ColorFilter.mode(
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light ? AppColors.black : AppColors.white,
                BlendMode.srcIn,
              ),
            ),
            10.getW(),
            Text(
              '$taskName :',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Theme.of(context).focusColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            datetime,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}
