class Api {
  
  static const BASE_URL = "http://192.168.43.44:8000";

  static String url(route) {
    return "$BASE_URL/$route";
  }

}