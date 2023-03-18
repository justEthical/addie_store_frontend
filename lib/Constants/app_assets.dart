class AppAssets{
  static String _getImagePath(String name){
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

  static String googleIcon = _getImagePath("google.svg");

}