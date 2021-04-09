import 'package:dio/dio.dart';
import 'package:todo_list/src/models/todo_list_model.dart';
import 'package:todo_list/src/repositories/todo_list_repository_interface.dart';

class TodoListRepository implements ITodoListRepository {
  Dio dio;
  final String url = 'https://jsonplaceholder.typicode.com/todos/';

  TodoListRepository([Dio client]) : dio = client ?? Dio();

  @override
  Future<List<TodoModel>> getTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;
    return list.map((todo) => TodoModel.fromJson(todo)).toList();
  }
}
