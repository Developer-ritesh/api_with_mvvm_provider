import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm_provider/models/todo_model.dart';

import '../helper/network_helper.dart';

class ApiServices {
  static Future<Object> getData() async {
    try {
      var uri = Uri.parse('https://dummyjson.com/todos');
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          TodoModel todoModel = TodoModel.fromJson(data);
          return Success(code: 200, response: todoModel);
        } else {
          return Failure(code: response.statusCode, response: 'Invalid Response Structure');
        }
      } else {
        return Failure(code: response.statusCode, response: 'Invalid Response Coming');
      }
    } catch (e) {
      return Failure(code: 500, response: 'Invalid Response: $e');
    }
  }
}
