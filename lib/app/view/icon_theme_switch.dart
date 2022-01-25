import 'package:basic_cubit/app/cubit/theme_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IconThemeSwitch extends StatelessWidget {
  const IconThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeSwitchState =
        context.select((ThemeModeCubit cubit) => cubit.state);
    return themeSwitchState == ThemeMode.light
        ? IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () => context.read<ThemeModeCubit>().setDarkTheme(),
          )
        : IconButton(
            icon: const Icon(Icons.light_mode),
            onPressed: () => context.read<ThemeModeCubit>().setLightTheme(),
          );
  }
}
