import 'package:todo_app_bloc/domain/entities/todo.dart';

abstract class TodoEvent {}

class loadsTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;
  AddTodo(this.todo);
}

class UpdateTodo extends TodoEvent {
  final Todo todo;
  UpdateTodo(this.todo);
}

class DeleteTodo extends TodoEvent {
  final Todo todo;
  DeleteTodo(this.todo);
}
