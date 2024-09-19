import 'package:flutter/material.dart';
import 'package:todo_app/utils/export_link.dart';

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
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "add_task",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w800),
                  ).tr(),
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
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.6, left: 20.w, right: 20.w),
                                dismissDirection: DismissDirection.up,
                                behavior: SnackBarBehavior.floating,
                                content: const Text("info_full").tr(),
                              ),
                            );
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
