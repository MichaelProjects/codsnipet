class Urls {
  static const String host = "http://localhost:28018";
  static Uri getCode(String codeId) {
    return Uri.parse('$host/api/v1/code/$codeId');
  }

  static Uri createCode = Uri.parse('$host/api/v1/code');

  static Uri getAllCode(int limit, int site) {
    return Uri.parse('$host/api/v1/code?limit=$limit&site=$site');
  }

  static Uri deleteCode(String codeId) {
    return Uri.parse('$host/api/v1/code/$codeId');
  }

  static Uri updateCode(String codeId) {
    return Uri.parse('$host/api/v1/code/$codeId');
  }
}