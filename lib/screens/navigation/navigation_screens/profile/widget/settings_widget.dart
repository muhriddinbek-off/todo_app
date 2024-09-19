import 'package:flutter/material.dart';

import 'package:todo_app/utils/export_link.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "settings".tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "application_theme".tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            10.getH(),
            BlocBuilder<ThemeCubit, bool>(
              builder: (context, state) {
                return SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "theme_mode".tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  value: state,
                  onChanged: (v) {
                    context.read<ThemeCubit>().getChangeThemeMode();
                    state ? AdaptiveTheme.of(context).setLight() : AdaptiveTheme.of(context).setDark();
                  },
                );
              },
            ),
            16.getH(),
            Text(
              "app_language".tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            26.getH(),
            BlocBuilder<RadioValueChangeCubit, int>(
              builder: (context, state) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.uzbekImage),
                      ),
                      title: Text("Uzbek", style: Theme.of(context).textTheme.titleLarge),
                      trailing: Radio(
                          value: 1,
                          groupValue: state,
                          onChanged: (v) {
                            context.read<RadioValueChangeCubit>().getChangeValue(v!, context);
                          }),
                    ),
                    const Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.rusImage),
                      ),
                      title: Text("Rus", style: Theme.of(context).textTheme.titleLarge),
                      trailing: Radio(
                          value: 2,
                          groupValue: state,
                          onChanged: (v) {
                            context.read<RadioValueChangeCubit>().getChangeValue(v!, context);
                          }),
                    ),
                    const Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.engImage),
                      ),
                      title: Text("Ingliz", style: Theme.of(context).textTheme.titleLarge),
                      trailing: Radio(
                          value: 3,
                          groupValue: state,
                          onChanged: (v) {
                            context.read<RadioValueChangeCubit>().getChangeValue(v!, context);
                          }),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
