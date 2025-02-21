import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_bloc/data/models/todo_model.dart';

class FirestoreDatasource {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference get _todoCollection =>
      _firebaseFirestore.collection('todo');

  Future<List<TodoModel>> getTodo() async {
    final snapshot = await _todoCollection.get();
    return snapshot.docs
        .map((doc) => TodoModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> addTodd(TodoModel todo) async {
    await _todoCollection.add(todo.toJson());
  }

  Future<void> updateTodo(TodoModel todo) async {
    await _todoCollection.doc(todo.id).update(todo.toJson());
  }

  Future<void> deleteTodo(String id) async {
    await _todoCollection.doc(id).delete();
  }
}
