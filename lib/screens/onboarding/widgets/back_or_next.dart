import 'package:flutter/material.dart';
import '../../../utils/export_link.dart';

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
            child: const Text("back").tr(),
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
              index != 2 ? "next" : "get_start",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),
            ).tr(),
          ),
        )
      ],
    );
  }
}
