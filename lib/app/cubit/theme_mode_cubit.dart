import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit({ThemeMode? initialState = ThemeMode.light})
      : super(initialState = initialState!);

  void _changeThemeMode(ThemeMode themeMode) {
    emit(themeMode);
  }

  void setLightTheme() {
    _changeThemeMode(ThemeMode.light);
  }

  void setDarkTheme() {
    _changeThemeMode(ThemeMode.dark);
  }

  void setSystemTheme() {
    _changeThemeMode(ThemeMode.system);
  }
}
