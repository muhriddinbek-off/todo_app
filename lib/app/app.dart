import 'package:flutter/material.dart';
import '../utils/export_link.dart';

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
        BlocProvider(create: (context) => RadioValueChangeCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return AdaptiveTheme(
            light: LightTheme.ligthTheme,
            dark: DarkTheme.darkTheme,
            initial: AdaptiveThemeMode.light,
            builder: (light, dark) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
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
