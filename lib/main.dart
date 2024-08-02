import 'package:flutter/material.dart';
import 'package:mvvm_provider/view/home.dart';
import 'package:mvvm_provider/view_model/todo_vm.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> TodoViewModel())
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
