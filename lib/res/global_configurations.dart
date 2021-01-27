class GlobalConfigurations {
  static bool isDarkMode = false;

  static void switchTheme() {
    GlobalConfigurations.isDarkMode = !GlobalConfigurations.isDarkMode;
  }
}
