import 'package:flutter/material.dart';
import 'package:todo_app/utils/export_link.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: context.read<OnboardingCubit>().state);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, int>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 46.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ZoomTapAnimation(
                  child: TextButton(
                      onPressed: () {
                        if (state != onbardingItem.length - 1) {
                          state++;
                          _pageController.animateToPage(
                            state,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        }
                      },
                      child: const Text(
                        "skip",
                      ).tr()),
                ),
                Expanded(
                  flex: 3,
                  child: PageView(
                    onPageChanged: (value) => context.read<OnboardingCubit>().getPage(value),
                    controller: _pageController,
                    children: List.generate(onbardingItem.length, (index) {
                      debugPrint(state.toString());
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(onbardingItem[index].image),
                          OnboardingSelectItem(changeIndex: state),
                          Text(
                            onbardingItem[index].title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ).tr(),
                          Text(
                            onbardingItem[index].description,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ).tr(),
                        ],
                      );
                    }),
                  ),
                ),
                BackOrNext(
                  index: state,
                  backTap: () {
                    if (state > 0) {
                      state--;
                      _pageController.animateToPage(
                        state,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    }
                  },
                  nextTap: () {
                    if (state != onbardingItem.length - 1) {
                      state++;
                      _pageController.animateToPage(
                        state,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    } else {
                      Navigator.pushNamed(context, AppRouteName.start);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
