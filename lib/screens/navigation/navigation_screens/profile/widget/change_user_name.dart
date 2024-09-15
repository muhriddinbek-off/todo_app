import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_size.dart';

class ChangeUserName extends StatelessWidget {
  final ValueChanged<String> onFirst;
  final ValueChanged<String> onLast;
  const ChangeUserName({
    super.key,
    required this.onFirst,
    required this.onLast,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Text(
        "Change User Name",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      title: const Divider(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: onFirst,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "First Name",
            ),
          ),
          10.getH(),
          TextField(
            onChanged: onLast,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Last Name",
            ),
          ),
        ],
      ),
      actions: [
        SizedBox(
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
