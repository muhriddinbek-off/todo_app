import 'package:flutter/material.dart';
import '../../utils/export_link.dart';

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
                NavigatorItem(
                    icon: state.onboardingIndex == 0 ? AppIcons.homeFull : AppIcons.home,
                    title: "home",
                    onChangeIndex: () {
                      context.read<NavigationCubit>().getSelectItemOnboarding(0);
                      context.read<NavigationCubit>().getAllTasksData();
                    }),
                40.getW(),
                NavigatorItem(
                    icon: state.onboardingIndex == 1 ? AppIcons.userFull : AppIcons.user,
                    title: "profile",
                    onChangeIndex: () {
                      context.read<NavigationCubit>().getSelectItemOnboarding(1);
                    }),
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
