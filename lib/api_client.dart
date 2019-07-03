import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testing/netutils.dart';
import 'package:testing/todomodel.dart';

class ApiClient {
  NetworkUtil net;
  final String _baseUrl = "https://test-server-todo-api.herokuapp.com";

  JsonDecoder _decoder = new JsonDecoder();

  ApiClient() {
    net = new NetworkUtil(baseUrl: _baseUrl);
  }

  Future<TodoModel> getTodo() async {
    var result = await net.get('/');
    var json = _decoder.convert(result);
    return TodoModel.fromJson(json);
  }

  Future<dynamic> addTodo(data) async {
    var result = await net.post('/', body: data);
    var json = _decoder.convert(result);
    return (json);
  } 
}
