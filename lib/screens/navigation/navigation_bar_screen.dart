import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/navigation/navigation_cubit.dart';
import 'package:todo_app/cubit/navigation/navigation_state.dart';
import 'package:todo_app/screens/navigation/navigation_screens/home/home_screen.dart';
import 'package:todo_app/screens/navigation/navigation_screens/profile/profile_screen.dart';
import 'package:todo_app/screens/navigation/widgets/navigator_item.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:todo_app/utils/app_size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'widgets/dialogs/show_modal_bottom_sheet_widget.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  List<Widget> screens = const [
    HomeScreen(),
    ProfileScreen(),
  ];

  TimeOfDay? timeOfDay;
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: screens[state.onboardingIndex],
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavigatorItem(icon: state.onboardingIndex == 0 ? AppIcons.homeFull : AppIcons.home, title: "Home", onChangeIndex: () => context.read<NavigationCubit>().getSelectItemOnboarding(0)),
                40.getW(),
                NavigatorItem(icon: state.onboardingIndex == 1 ? AppIcons.userFull : AppIcons.user, title: "Profile", onChangeIndex: () => context.read<NavigationCubit>().getSelectItemOnboarding(1)),
              ],
            ),
          ),
          floatingActionButton: ZoomTapAnimation(
            child: FloatingActionButton.large(
              autofocus: true,
              enableFeedback: true,
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
              onPressed: () {
                showModalDialog(
                  context,
                  dateTime: dateTime,
                  timeOfDay: timeOfDay,
                  changeIndex: context.read<NavigationCubit>().getSelectItemDialog,
                  stateIndex: state.dialogIndex,
                  tasks: (value) {
                    context.read<NavigationCubit>().getInsertTasks(value);
                    context.read<NavigationCubit>().getAllTasksData();
                  },
                );
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
