import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_images.dart';
import 'package:todo_app/utils/app_size.dart';

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
            "What do you want to do today?",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          20.getH(),
          Text(
            "Tap + to add your tasks",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
