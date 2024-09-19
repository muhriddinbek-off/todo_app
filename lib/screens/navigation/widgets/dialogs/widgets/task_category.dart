import 'package:flutter/material.dart';
import 'package:todo_app/utils/export_link.dart';

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
              "choose_category",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),
            ).tr(),
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
                        SizedBox(
                          width: width * 0.18,
                          child: Text(
                            categories[index].categoryName,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall,
                          ).tr(),
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
                      "add_category",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),
                    ).tr(),
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
