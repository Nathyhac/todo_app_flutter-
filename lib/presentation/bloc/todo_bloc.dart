import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/domain/repository/todo_repository.dart';
import 'package:todo_app_bloc/presentation/bloc/todo_event.dart';
import 'package:todo_app_bloc/presentation/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc(this.todoRepository) : super(TodoLoading()) {
    on<loadsTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  Future<void> _onLoadTodos(loadsTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final todos = await todoRepository.getTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError("Failed to load todos"));
    }
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    try {
      await todoRepository.addTodo(event.todo);
      final todos = await todoRepository.getTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError("Failed to add todo"));
    }
  }

  Future<void> _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    try {
      await todoRepository.updateTodo(event.todo);
      final todos = await todoRepository.getTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError("Failed to update todo"));
    }
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    try {
      await todoRepository.deleteTodo(event.todo.id);
      final todos = await todoRepository.getTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError("Failed to delete todo"));
    }
  }
}
