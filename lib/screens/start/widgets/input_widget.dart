import 'package:flutter/material.dart';
import 'package:todo_app/utils/export_link.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;

  final String title;
  const InputWidget({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: title,
          hintStyle: Theme.of(context).textTheme.titleLarge,
        ),
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
