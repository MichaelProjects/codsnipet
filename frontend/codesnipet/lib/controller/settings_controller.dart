import 'package:shared_preferences/shared_preferences.dart';

class SettingsStorage {
  String appUrl = "io.opensight.codesnipt";
  static String hostUrl = "localhost:28029";
  Future storeHostUrl(String hostUrl) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(appUrl + "hostUrl", hostUrl);
  }

  Future<String> loadHostUrl() async {
    final prefs = await SharedPreferences.getInstance();
    hostUrl = prefs.getString(appUrl + "hostUrl") ?? "localhost:28029";
    return hostUrl;
  }
}
