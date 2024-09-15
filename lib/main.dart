import 'package:flutter/material.dart';
import 'package:todo_app/app/app.dart';
import 'package:todo_app/data/local/shared_preferenses_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.instance;
  runApp(const App());
}
