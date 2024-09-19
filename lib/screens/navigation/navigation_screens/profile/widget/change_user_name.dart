import 'package:flutter/material.dart';
import 'package:todo_app/utils/export_link.dart';

class ChangeUserName extends StatelessWidget {
  final ValueChanged<String> onFirst;
  final ValueChanged<String> onLast;
  final Function() onChangeValue;
  const ChangeUserName({
    super.key,
    required this.onFirst,
    required this.onLast,
    required this.onChangeValue,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Text(
        "change_account_name".tr(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      title: const Divider(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: onFirst,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: "first_name".tr(),
            ),
          ),
          10.getH(),
          TextField(
            onChanged: onLast,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: "last_name".tr(),
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
                  child: Text("cancel".tr()),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: onChangeValue,
                  child: Text("save".tr()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
