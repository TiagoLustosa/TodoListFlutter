import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/src/controllers/home_controller.dart';
import 'package:todo_list/src/models/todo_list_model.dart';
import 'package:todo_list/src/repositories/todo_list_repository.dart';

class TodoListRepositoryMock extends Mock implements TodoListRepository {}

main() {
  final repository = TodoListRepositoryMock();
  final controller = HomeController(repository);

  test('deve preencher a variavel todos', () async {
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.success);
    when(repository.getTodos()).thenAnswer((_) async => [TodoModel()]);

    expect(controller.todos.isNotEmpty, true);
  });

  test('should modify state to error if request fail', () async {
    when(repository.getTodos()).thenThrow(Exception());
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.error);
  });
}
