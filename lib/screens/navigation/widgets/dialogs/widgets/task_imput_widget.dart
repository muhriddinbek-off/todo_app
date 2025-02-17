import 'package:flutter/material.dart';
import '../../../../../utils/export_link.dart';

class TaskInputWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptonController;
  const TaskInputWidget({
    super.key,
    required this.titleController,
    required this.descriptonController,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Theme.of(context).disabledColor),
            ),
            filled: true,
            fillColor: AppColors.transparent,
            hintText: "title".tr(),
            hintStyle: Theme.of(context).textTheme.titleLarge,
          ),
          minLines: 1,
          maxLines: 2,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextField(
          controller: descriptonController,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Theme.of(context).disabledColor),
            ),
            filled: true,
            fillColor: AppColors.transparent,
            hintText: "description".tr(),
            hintStyle: Theme.of(context).textTheme.titleLarge,
          ),
          minLines: 1,
          maxLines: 2,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
