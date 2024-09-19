import 'package:flutter/material.dart';
import 'package:todo_app/utils/export_link.dart';

class LogOutWidget extends StatelessWidget {
  final Function() onTap;
  const LogOutWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Text(
        "log_out".tr(),
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      title: const Divider(),
      content: Text(
        "log_out_app".tr(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
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
                  child: Text("cancel".tr()),
                ),
              ),
              Expanded(
                child: ZoomTapAnimation(
                  onTap: onTap,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: AppColors.c8687E7,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      "log_out".tr(),
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
  }
}
