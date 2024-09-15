import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

Future<dynamic> taskPrority(
  BuildContext context, {
  required ValueChanged<int> onChangeValue,
  required int stateIndex,
}) {
  int p = 0;
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            icon: Text(
              "Task Priority",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),
            ),
            title: const Divider(),
            content: SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.3,
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                ),
                itemBuilder: (context, index) {
                  return ZoomTapAnimation(
                    onTap: () {
                      setState(() {
                        stateIndex = index;
                        p = stateIndex + 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: stateIndex == index ? AppColors.c9741CC : Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(4.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 4),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            AppIcons.flag,
                            colorFilter: ColorFilter.mode(
                              stateIndex == index ? AppColors.white : Theme.of(context).disabledColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          Text(
                            "${index + 1}",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: stateIndex == index ? AppColors.white : Theme.of(context).disabledColor),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cansel"),
                    ),
                  ),
                  Expanded(
                    child: ZoomTapAnimation(
                      onTap: () {
                        onChangeValue(p);
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: AppColors.c8687E7,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          "Save",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );
}
