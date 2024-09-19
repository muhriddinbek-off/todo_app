import 'package:flutter/material.dart';

import '../../../../../../utils/export_link.dart';

class DrawerMainWidget extends StatelessWidget {
  const DrawerMainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeaderPart(),
          BlocBuilder<ThemeCubit, bool>(
            builder: (context, state) {
              return DrawerBodyWidget(
                changeTheme: () {
                  context.read<ThemeCubit>().getChangeThemeMode();
                  state ? AdaptiveTheme.of(context).setLight() : AdaptiveTheme.of(context).setDark();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
