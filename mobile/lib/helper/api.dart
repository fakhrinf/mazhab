class Api {
  
  static const BASE_URL = "http://192.168.1.10:8000";

  static String url(route) {
    return "$BASE_URL/$route";
  }

}