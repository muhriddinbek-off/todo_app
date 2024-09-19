import 'package:flutter/material.dart';
import 'utils/export_link.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  StorageRepository.instance;
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'EN'),
        Locale('uz', 'UZ'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      useOnlyLangCode: true,
      fallbackLocale: const Locale('uz', 'UZ'),
      child: const App(),
    ),
  );
}
