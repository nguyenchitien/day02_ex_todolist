class GlobalConfigurations {
  static bool _isDarkMode = false;

  static bool get isDarkMode => _isDarkMode;

  static void switchTheme() {
    _isDarkMode = !_isDarkMode;
  }
}
