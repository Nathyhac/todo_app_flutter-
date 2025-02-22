import 'package:todo_app_bloc/domain/entities/todo.dart';
import 'package:todo_app_bloc/domain/repository/todo_repository_impl.dart';

class TodoUpdate {
  final TodoRepository repository;
  TodoUpdate(this.repository);

  Future<void> call(Todo todo) {
    return repository.updateTodo(todo);
  }
}
