import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/cubit/initial_value/initial_value_cubit.dart';
import 'package:todo_app/cubit/navigation/navigation_cubit.dart';
import 'package:todo_app/cubit/onboarding/onboarding_cubit.dart';
import 'package:todo_app/cubit/theme/theme_cubit.dart';
import 'package:todo_app/screens/routes.dart';
import 'package:todo_app/utils/theme/dark_theme.dart';
import 'package:todo_app/utils/theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingCubit()),
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => InitialValueCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return AdaptiveTheme(
            light: LightTheme.ligthTheme,
            dark: DarkTheme.darkTheme,
            initial: AdaptiveThemeMode.system,
            builder: (light, dark) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: light,
                darkTheme: dark,
                initialRoute: AppRouteName.splash,
                onGenerateRoute: AppRoutes.getRoutes,
              );
            },
          );
        },
      ),
    );
  }
}
