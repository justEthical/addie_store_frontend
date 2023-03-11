class AppAssets{
  static String _getImagePath(String name){
    return "Assets/Images/$name";
  }

  static String welcome1 = _getImagePath("welcome1.svg");
  static String welcome2 = _getImagePath("welcome2.svg");
  static String welcome3 = _getImagePath("welcome3.svg");
}