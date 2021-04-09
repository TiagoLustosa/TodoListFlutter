import 'package:flutter/cupertino.dart';
import 'package:todo_list/src/models/todo_list_model.dart';
import 'package:todo_list/src/repositories/todo_list_repository.dart';

class HomeController {
  final TodoListRepository _todoListRepository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  List<TodoModel> todos = [];
  HomeController([TodoListRepository repository])
      : _todoListRepository = repository ?? TodoListRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _todoListRepository.getTodos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { loading, start, error, success }
