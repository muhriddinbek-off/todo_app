import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingSelectItem extends StatelessWidget {
  final int changeIndex;
  const OnboardingSelectItem({super.key, required this.changeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            height: 4.h,
            width: 26.w,
            decoration: BoxDecoration(
              color: changeIndex == index ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        );
      }),
    );
  }
}
