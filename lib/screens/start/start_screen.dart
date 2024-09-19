import 'package:flutter/material.dart';
import 'package:todo_app/utils/export_link.dart';

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
                      SizedBox(
                        width: width * 0.8,
                        child: Text(
                          "welcome_title",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ).tr(),
                      ),
                    ],
                  ),
                  16.getH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      "welcome_subtitle",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ).tr(),
                  ),
                  30.getH(),
                  InputWidget(
                    controller: _firstNameController,
                    title: "first_name".tr(),
                  ),
                  InputWidget(
                    controller: _lastNameController,
                    title: "last_name".tr(),
                  ),
                  const Spacer(),
                  ZoomTapAnimation(
                    onTap: () {
                      if (_firstNameController.text.isNotEmpty && _lastNameController.text.isNotEmpty) {
                        Navigator.pushNamedAndRemoveUntil(context, AppRouteName.navigationScreen, (context) => false);
                        context.read<InitialValueCubit>().getCreateFullName(first: _firstNameController.text, last: _lastNameController.text);
                        context.read<InitialValueCubit>().getChangeValue(isChange: true);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                            backgroundColor: AppColors.cCC8441,
                            content: const Text("welcome_subtitle").tr(),
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
                        "come",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),
                      ).tr(),
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
