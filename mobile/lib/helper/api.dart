class Api {
  
  static const BASE_URL = "http://192.168.10.59:8000";

  static String url(route) {
    return "$BASE_URL/$route";
  }

}