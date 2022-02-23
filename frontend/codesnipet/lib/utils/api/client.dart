import 'http_client.dart';
import 'urls.dart';

class ApiClient {
  static Map<String, String> authHeader = {"Authorization": "Bearer 123123"};

  Future getAllSnipets(int limit, int site) async {
    Map response = await HttpClient().get(Urls.getAllCode(limit, site));

    if (response["error"] == true) {
      return response;
    }
    return response["data"];
  }

  Future getApplication(String codeId) async {
    Map response = await HttpClient().get(Urls.getCode(codeId));
    if (response["error"] == true) {}
    return response["data"];
  }
}
