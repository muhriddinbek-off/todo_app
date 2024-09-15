import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/cubit/navigation/navigation_cubit.dart';
import 'package:todo_app/cubit/navigation/navigation_state.dart';
import 'package:todo_app/screens/navigation/navigation_screens/home/widgets/delete_task/delete_task.dart';
import 'package:todo_app/screens/navigation/navigation_screens/home/widgets/empty_database_widget.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:todo_app/utils/app_size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'widgets/darawer/drawer_widget.dart';
import 'widgets/task_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    context.read<NavigationCubit>().getAllTasksData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const DrawerMainWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              leading: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: ZoomTapAnimation(
                  onTap: () => _key.currentState!.openDrawer(),
                  child: SvgPicture.asset(
                    AppIcons.menu,
                    colorFilter: ColorFilter.mode(
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light ? AppColors.black : AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Home",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              actions: [
                CircleAvatar(
                  backgroundColor: AppColors.c9741CC,
                  radius: 40.r,
                  child: SvgPicture.asset(AppIcons.user),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
            SliverToBoxAdapter(child: 10.getH()),
            BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
                if (state.tasks.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: EmptyDatabaseWidget(),
                  );
                }
                return SliverList.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index) {
                    return TaskItemWidget(
                      taskModel: state.tasks[index],
                      onNextPage: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeleteTask(
                              taskModel: state.tasks[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
