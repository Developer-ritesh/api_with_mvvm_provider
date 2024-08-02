import 'package:flutter/material.dart';
import 'package:mvvm_provider/view_model/todo_vm.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodoViewModel todo = Provider.of<TodoViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> todo.getTodoResponse(),
        child: Text('Get'),
      ),
      body: ListView.builder(
        itemCount: todo.todos.length,
        itemBuilder: (context, index) {
          final model = todo.todos[index];
          return ListTile(
            title: Text(model.todo),
          );
        },
      ),
    );
  }
}
