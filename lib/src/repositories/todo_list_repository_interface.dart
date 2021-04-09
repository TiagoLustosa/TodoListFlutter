import 'package:todo_list/src/models/todo_list_model.dart';

abstract class ITodoListRepository {
  Future<List<TodoModel>> getTodos();
}
