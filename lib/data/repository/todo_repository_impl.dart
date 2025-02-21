import 'package:todo_app_bloc/data/datasources/firestore_datasource.dart';
import 'package:todo_app_bloc/data/models/todo_model.dart';
import 'package:todo_app_bloc/domain/entities/todo.dart';
import 'package:todo_app_bloc/domain/repository/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  final FirestoreDatasource firestoreDatasource;

  TodoRepositoryImpl({required this.firestoreDatasource});

  //====Get all todos====//
  Future<List<Todo>> getTodos() async {
    final todoModels = await firestoreDatasource.getTodo();
    return todoModels
        .map((todo) =>
            Todo(id: todo.id, title: todo.title, iscompleted: todo.iscompleted))
        .toList();
  }

  //=========add to-do to a firebase=========//
  Future<void> addTodo(Todo todo) async {
    final todoModel = TodoModel(
        id: todo.id, title: todo.title, iscompleted: todo.iscompleted);
    await firestoreDatasource.addTodd(todoModel);
  }

  Future<void> updateTodo(Todo todo) async {
    final todoModel = TodoModel(
        id: todo.id, title: todo.title, iscompleted: todo.iscompleted);
    await firestoreDatasource.updateTodo(todoModel);
  }

  Future<void> deleteTodo(String todoId) async {
    await firestoreDatasource.deleteTodo(todoId);
  }
}
