// lib/domain/repositories/todo_repository.dart

import 'package:todo_app_bloc/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(String todoId);
}
