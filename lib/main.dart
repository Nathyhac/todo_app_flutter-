import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_app_bloc/data/repository/todo_repository_impl.dart';
import 'package:todo_app_bloc/domain/repository/todo_repository.dart';
import 'package:todo_app_bloc/presentation/bloc/todo_bloc.dart';
import 'package:todo_app_bloc/presentation/bloc/todo_event.dart';
import 'package:todo_app_bloc/presentation/pages/todo_page.dart';

void main() {
  final TodoRepository todoRepository = TodoRepositoryImpl();

  runApp(
    BlocProvider(
      create: (context) =>
          TodoBloc(todoRepository)..add(LoadTodos() as TodoEvent),
      child: MyApp(),
    ),
  );
}

class LoadTodos {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoPage(),
    );
  }
}
