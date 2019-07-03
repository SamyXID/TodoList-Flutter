import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

class NetworkUtil {
  final String baseUrl;

  final _client = new http.Client();
  final _timeout = new Duration(seconds: 30);

  NetworkUtil({this.baseUrl});

  Future<dynamic> get(String path) async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // var token = prefs.getString('access_token');

      // print("curl -g -H 'X-access-token: $token'  ${this.baseUrl}$path");

      return _client.get(baseUrl + path).then((http.Response response) {
        var res = response.body;
        int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400 || json == null) {
          return res;
        } else {
          return res;
        }
      }).timeout(_timeout);
    } on TimeoutException catch (_) {
      return '{"code": 504, "description": "Connection Timeout", "result": ""}';
    } on SocketException catch (_) {
      return '{"code": 400, "description": "Connection Error", "result": ""}';
    }
  }

  Future<dynamic> post(String path, {Map headers, body, encoding}) async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // var token = prefs.getString('access_token');

      return _client
          .post(Uri.parse(baseUrl + path),
              // headers: {
              //   HttpHeaders.contentTypeHeader: 'application/json',
              //   'X-Access-Token': token
              // },
              body: json.encode(body))
          .then((http.Response response) {
        var res = response.body;
        int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400 || json == null) {
          return res;
        } else {
          return res;
        }
      }).timeout(_timeout);
    } on TimeoutException catch (_) {
      return '{"code": 504, "description": "Connection Timeout", "result": ""}';
    } on SocketException catch (_) {
      return '{"code": 400, "description": "Connection Error", "result": ""}';
    }
  }
}
