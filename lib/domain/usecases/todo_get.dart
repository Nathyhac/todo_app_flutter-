import 'package:todo_app_bloc/domain/entities/todo.dart';
import 'package:todo_app_bloc/domain/repository/todo_repository_impl.dart';

class GetTodos {
  final TodoRepository repository;

  GetTodos(this.repository);

  Future<List<Todo>> call() {
    return repository.getTodos();
  }
}
