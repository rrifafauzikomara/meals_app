enum Flavors { DEVELOPMENT, PRODUCTION }

class Config {
  static Flavors appFlavors;

  static String get title {
    switch (appFlavors) {
      case Flavors.PRODUCTION:
        return 'Meals App';
      case Flavors.DEVELOPMENT:
      default:
        return 'Meals Development';
    }
  }

  static bool get isDebug {
    switch (appFlavors) {
      case Flavors.PRODUCTION:
        return false;
      case Flavors.DEVELOPMENT:
      default:
        return true;
    }
  }
}
