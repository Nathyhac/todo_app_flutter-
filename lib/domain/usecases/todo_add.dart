import 'package:todo_app_bloc/domain/entities/todo.dart';
import 'package:todo_app_bloc/domain/repository/todo_repository_impl.dart';

class TodoAdd {
  final TodoRepository repository;
  TodoAdd(this.repository);
  Future<void> addTodo(Todo todo) {
    return repository.addTodo(todo);
  }
}
