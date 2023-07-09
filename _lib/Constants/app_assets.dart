class AppAssets {
  static String _getImagePath(String name) {
    return "Assets/Images/$name";
  }

  static String welcome1 = _getImagePath("welcome1.svg");
  static String welcome2 = _getImagePath("welcome2.svg");
  static String welcome3 = _getImagePath("welcome3.svg");

  static String atIcon = _getImagePath("at-sign.svg");
  static String lockIcon = _getImagePath("lock.svg");
  static String eyeIcon = _getImagePath("eye.svg");
  static String eyeClosed = _getImagePath("eye-off.svg");
  static String phoneIcon = _getImagePath("phone.svg");

  // Bottom bar icons
  static String home = _getImagePath("home.svg");
  static String food = _getImagePath("fork.svg");
  static String grocery = _getImagePath("shopping-bag.svg");
  static String profile = _getImagePath("user.svg");

  // Categories icon
  static String burger = _getImagePath("burger.svg");
  static String chicken = _getImagePath("chicken.svg");
  static String drink = _getImagePath("drink.svg");
  static String pizza = _getImagePath("pizza.svg");
  static String meal = _getImagePath("meal.svg");
  
  static String googleIcon = _getImagePath("google.svg");
}
