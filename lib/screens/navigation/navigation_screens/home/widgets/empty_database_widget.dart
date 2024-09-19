import 'package:flutter/material.dart';
import '../../../../../utils/export_link.dart';

class EmptyDatabaseWidget extends StatelessWidget {
  const EmptyDatabaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.17,
          ),
          Center(
            child: Image.asset(AppImages.cheklist),
          ),
          Text(
            "task_title",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ).tr(),
          20.getH(),
          Text(
            "task_subtitle",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
        ],
      ),
    );
  }
}
