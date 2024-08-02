import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/helper/network_helper.dart';
import 'package:mvvm_provider/models/todo_model.dart';
import 'package:mvvm_provider/services/services.dart';

class TodoViewModel extends ChangeNotifier {
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  void setTodos(List<Todo> todos) {
    _todos = todos;
    notifyListeners();
  }

  getTodoResponse() async {
    log('call');
    var finalResponse = await ApiServices.getData();
    if (finalResponse is Success) {
      log('success');
      TodoModel todoModel = finalResponse.response as TodoModel;
      setTodos(todoModel.todos);
    } else if (finalResponse is Failure) {
      log('failure');
      log('Error code: ${finalResponse.code}');
      log('Error message: ${finalResponse.response}');
    } else {
      log('Unexpected response type: ${finalResponse.runtimeType}');
    }
  }
}
