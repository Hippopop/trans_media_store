import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_media_store/src/services/theme/light/light_theme.dart';

import 'theme_state/app_theme_state.dart';

final themeStateProvider = NotifierProvider<ThemeController, AppThemeState>(
  ThemeController.new,
);

class ThemeController extends Notifier<AppThemeState> {
  toggleAppTheme(String newThemeKey) async {
    ref.invalidateSelf();
  }

  @override
  AppThemeState build() {
    return AppThemeState(
      currentTheme: lightTheme,
      availableThemeSet: {},
    );
  }
}
