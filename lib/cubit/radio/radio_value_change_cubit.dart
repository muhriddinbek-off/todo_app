import 'package:flutter/material.dart';
import '../../utils/export_link.dart';

class RadioValueChangeCubit extends Cubit<int> {
  RadioValueChangeCubit() : super(1);

  void getChangeValue(int value, BuildContext context) {
    emit(value);
    if (state == 1) {
      context.setLocale(const Locale("uz", "UZ"));
    }
    if (state == 2) {
      context.setLocale(const Locale("ru", "RU"));
    }
    if (state == 3) {
      context.setLocale(const Locale("en", "EN"));
    }
  }
}
