import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BackOrNext extends StatelessWidget {
  final Function() backTap;
  final Function() nextTap;
  final int index;
  const BackOrNext({
    super.key,
    required this.backTap,
    required this.nextTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ZoomTapAnimation(
          child: TextButton(
            onPressed: backTap,
            child: const Text("Back"),
          ),
        ),
        ZoomTapAnimation(
          onTap: nextTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.c8687E7,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              index != 2 ? "NEXT" : "GET STARTED",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),
            ),
          ),
        )
      ],
    );
  }
}
