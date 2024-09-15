import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/theme/theme_cubit.dart';
import 'package:todo_app/screens/navigation/navigation_screens/home/widgets/darawer/drawer_parts/drawer_body.dart';
import 'package:todo_app/screens/navigation/navigation_screens/home/widgets/darawer/drawer_parts/drawer_header.dart';

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
