import 'package:todo_app_bloc/domain/repository/todo_repository_impl.dart';

class TodoDelete {
  final TodoRepository repository;
  TodoDelete(this.repository);

  Future<void> call(String todoId) {
    return repository.deleteTodo(todoId);
  }
}
