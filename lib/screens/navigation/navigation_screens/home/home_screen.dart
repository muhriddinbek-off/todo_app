import 'package:flutter/material.dart';

import 'package:todo_app/utils/export_link.dart';

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
                "home",
                style: Theme.of(context).textTheme.titleLarge,
              ).tr(),
              actions: [
                CircleAvatar(
                  backgroundColor: AppColors.c9741CC,
                  radius: 40.r,
                  backgroundImage: StorageRepository.getString(key: AppConstanta.accountImage) != ""
                      ? FileImage(
                          File(
                            StorageRepository.getString(key: AppConstanta.accountImage),
                          ),
                        )
                      : AssetImage(AppImages.accountImage),
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
                if (state.tasks.isNotEmpty) {
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
                }
                if (state.tasks.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: EmptyDatabaseWidget(),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
