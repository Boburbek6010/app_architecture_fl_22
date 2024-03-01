import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkService {
  // baseUrl
  static const BASEURL = '6554a27063cafc694fe6bbeb.mockapi.io';

  // APIS
  static String apiPosts = '/posts';

  // headers
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  //methods
  static Future<String?> GET(String api, Map<String, String> params) async {
    final url = Uri.http(BASEURL, api, params);
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> body) async {
    Uri url = Uri.http(BASEURL, api);
    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(
      String api, Map<String, dynamic> body, Map<String, dynamic> param) async {
    final url = Uri.http(BASEURL, api, param);
    final response =
        await http.put(url, body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    final url = Uri.http(BASEURL, api, params);
    final response = await http.delete(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  /// params

  static Map<String, String> emptyParams() => <String, String>{};

  static Map<String, String> paramSignIn(String email, String password) =>
      <String, String>{"email": email, "password": password};

  /// body

  static Map<String, dynamic> bodyEmpty() => <String, dynamic>{};

  static Map<String, String> bodyLoginUser({required String email, required String password}) =>
      <String, String>{"email": email, "password": password};

  static Map<String, String> bodyResetPassword({required String email}) => <String, String>{"email": email};

  static Map<String, String> bodyConfirmPassword({required String password, required String confirmPassword, required String token}) =>
      <String, String>{"password": password, "password2": confirmPassword, "token":token};
}
