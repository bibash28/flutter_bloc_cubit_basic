import 'package:basic_cubit/app/cubit/theme_mode_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App Theme Cubit', () {
    test('Initial State is Light mode', () {
      expect(ThemeModeCubit().state, equals(ThemeMode.light));
    });

    blocTest<ThemeModeCubit, ThemeMode>(
      'Change to light theme when LightTheme is called',
      build: () => ThemeModeCubit(),
      act: (cubit) => cubit.setLightTheme(),
      expect: () => [equals(ThemeMode.light)],
    );

    blocTest<ThemeModeCubit, ThemeMode>(
      'Change to dark theme when DarkTheme is called',
      build: () => ThemeModeCubit(),
      act: (cubit) => cubit.setDarkTheme(),
      expect: () => [equals(ThemeMode.dark)],
    );

    blocTest<ThemeModeCubit, ThemeMode>(
      'Change to system theme when SystemTheme is called',
      build: () => ThemeModeCubit(),
      act: (cubit) => cubit.setSystemTheme(),
      expect: () => [equals(ThemeMode.system)],
    );
  });
}
