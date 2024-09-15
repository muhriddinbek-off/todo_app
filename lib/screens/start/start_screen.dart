import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/cubit/initial_value/initial_value_cubit.dart';
import 'package:todo_app/cubit/initial_value/initial_value_state.dart';
import 'package:todo_app/screens/routes.dart';
import 'package:todo_app/screens/start/widgets/input_widget.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:todo_app/utils/app_size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InitialValueCubit, InitialValueState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZoomTapAnimation(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppIcons.arrowBack,
                      colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to UpTodo",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  16.getH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      "please enter your first and last name",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  30.getH(),
                  InputWidget(
                    controller: _firstNameController,
                    title: "First Name",
                  ),
                  InputWidget(
                    controller: _lastNameController,
                    title: "Last Name",
                  ),
                  const Spacer(),
                  ZoomTapAnimation(
                    onTap: () {
                      if (_firstNameController.text.isNotEmpty && _lastNameController.text.isNotEmpty) {
                        Navigator.pushNamed(context, AppRouteName.navigationScreen);
                        context.read<InitialValueCubit>().getCreateFullName(first: _firstNameController.text, last: _lastNameController.text);
                        context.read<InitialValueCubit>().getChangeValue(isChange: true);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                            backgroundColor: AppColors.cCC8441,
                            content: const Text("Please enter your first and last name"),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.c8687E7,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        "Come on, let's go",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                  26.getH(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
