import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/screens/navigation/widgets/dialogs/widgets/task_category.dart';
import 'package:todo_app/screens/navigation/widgets/dialogs/widgets/task_prority.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:todo_app/utils/app_size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'widgets/task_imput_widget.dart';

Future<void> showModalDialog(
  BuildContext context, {
  required DateTime? dateTime,
  required TimeOfDay? timeOfDay,
  required ValueChanged<int> changeIndex,
  required int stateIndex,
  required ValueChanged<TaskModel> tasks,
}) {
  TaskModel taskModel = TaskModel.initialValue;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Task",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w800),
                ),
                20.getH(),
                TaskInputWidget(
                  titleController: titleController,
                  descriptonController: descriptionController,
                ),
                20.getH(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        dedlineItem(
                          context,
                          icon: AppIcons.calendar,
                          onChange: () async {
                            dateTime = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050),
                            );
                            if (dateTime != null) {
                              taskModel = taskModel.copyWith(dedline: dateTime);
                            }
                          },
                        ),
                        20.getW(),
                        dedlineItem(
                          context,
                          icon: AppIcons.timer,
                          onChange: () async {
                            timeOfDay = await showTimePicker(
                              initialEntryMode: TimePickerEntryMode.inputOnly,
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            debugPrint(timeOfDay.toString());
                            if (timeOfDay != null) {
                              DateTime dt = taskModel.dedline;
                              dt = dt.copyWith(
                                hour: timeOfDay!.hour,
                                minute: timeOfDay!.minute,
                              );
                              debugPrint(dt.toString());
                              taskModel = taskModel.copyWith(dedline: dt);
                            }
                          },
                        ),
                        20.getW(),
                        dedlineItem(
                          context,
                          icon: AppIcons.flag,
                          onChange: () {
                            taskPrority(
                              context,
                              stateIndex: stateIndex,
                              onChangeValue: (value) {
                                taskModel = taskModel.copyWith(priority: value);
                              },
                            );
                          },
                        ),
                        20.getW(),
                        dedlineItem(
                          context,
                          icon: AppIcons.tag,
                          onChange: () {
                            taskCategory(
                              context,
                              onChangeValue: (v) {
                                taskModel = taskModel.copyWith(category: v);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    dedlineItem(
                      context,
                      icon: AppIcons.send,
                      onChange: () {
                        taskModel = taskModel.copyWith(
                          title: titleController.text,
                          description: descriptionController.text,
                        );
                        if (taskModel.canAddTaskToDatabase()) {
                          tasks(taskModel);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.6, left: 20.w, right: 20.w),
                              dismissDirection: DismissDirection.up,
                              behavior: SnackBarBehavior.floating,
                              content: const Text("Malumotlar muvafaqiyatli qo'shildi"),
                            ),
                          );
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.6, left: 20.w, right: 20.w),
                              dismissDirection: DismissDirection.up,
                              behavior: SnackBarBehavior.floating,
                              content: const Text("Malumotlarni to'ldiring"),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
                20.getH(),
              ],
            ),
          ),
        ),
      );
    },
  );
}

ZoomTapAnimation dedlineItem(BuildContext context, {required String icon, required Function() onChange}) {
  return ZoomTapAnimation(
    onTap: onChange,
    child: SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(
        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light ? AppColors.black : AppColors.white,
        BlendMode.srcIn,
      ),
    ),
  );
}
