import 'package:flutter/material.dart'
    show BorderRadius, ElevatedButton, RoundedRectangleBorder, ThemeData;

import 'dark/dark_theme.dart' show darkTheme;
import 'light/light_theme.dart' show lightTheme;

enum SelectedTheme {
  light,
  dark,
}

extension SelectedThemeExtension on SelectedTheme {
  ThemeData get theme {
    switch (this) {
      case SelectedTheme.light:
        return lightTheme;
      case SelectedTheme.dark:
        return darkTheme;
    }
  }
}

final roundedButtonStyle = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
);
