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

  Future<Map> createCodeSnipett(
      String language, String title, String code, List<String> tags) async {
    Map response = await HttpClient().post(Urls.createCode,
        {"language": language, "title": title, "code": code, "tags": tags});
    if (response["error"] == true) {
      return response;
    }
    return response["data"];
  }

  Future deleteCode(String id) async{
    Map response = await HttpClient().delete(Urls.deleteCode(id));
    if (response["error"] == true) {
      return response;
    }
    return response["data"];
  }

  Future searchCode(String searchTerm) async {
    Map response = await HttpClient().get(Urls.searchCode(searchTerm));
    if (response["error"] == true) {
      return response;
    }
    return response["data"];
  }
}
