import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/data/models/category/choose_category_model.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

Future<dynamic> taskCategory(
  BuildContext context, {
  required ValueChanged<String> onChangeValue,
}) {
  String title = '';
  int i = 0;
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            icon: Text(
              "Choose Category",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),
            ),
            title: const Divider(),
            content: SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.55,
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 25.w,
                  mainAxisSpacing: 15.h,
                  mainAxisExtent: height * 0.12,
                ),
                itemBuilder: (context, index) {
                  return ZoomTapAnimation(
                    onTap: () {
                      setState(() {
                        i = index;
                        title = categories[i].categoryName;
                        debugPrint(title);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 18.h),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: categories[index].categoryColor.withOpacity(i == index ? 0.2 : 1),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: SvgPicture.asset(
                                categories[index].categoryIcon,
                                height: 30.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        6.getH(),
                        Text(
                          categories[index].categoryName,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            actions: [
              SizedBox(
                width: double.maxFinite,
                child: ZoomTapAnimation(
                  onTap: () {
                    onChangeValue(title);
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
                      "Add Category",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
