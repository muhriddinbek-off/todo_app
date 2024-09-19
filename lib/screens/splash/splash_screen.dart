import 'package:flutter/material.dart';
import 'package:todo_app/utils/export_link.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> getNextPage() async {
    Future.delayed(const Duration(seconds: 2), () {
      if (StorageRepository.getBool(key: AppConstanta.storageValue) == false) {
        return Navigator.pushNamedAndRemoveUntil(context, AppRouteName.onboarding, (context) => false);
      } else {
        return Navigator.pushNamedAndRemoveUntil(context, AppRouteName.navigationScreen, (context) => false);
      }
    });
  }

  @override
  void initState() {
    getNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.logo),
            20.getH(),
            Text(
              "UpTodo",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 40.sp),
            ),
          ],
        ),
      ),
    );
  }
}
