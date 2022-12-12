import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<bool> setAccessToken(String value) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.setString("google_signin", value);
  }

  Future<String?> getAccessToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getString("google_signin");
  }

  Future<bool> removeAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove("google_signin");
  }
}
