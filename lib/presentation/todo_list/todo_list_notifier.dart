import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/infrastructure/todo_item_repository.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_list/todo_list_state.dart';

final todoListStateProvider =
    StateNotifierProvider<TodoListNotifier, TodoListState>(
  (ref) => TodoListNotifier(
    todoItemRepository: ref.read(todoItemRepository),
  )..init(),
);

class TodoListNotifier extends StateNotifier<TodoListState> {
  TodoListNotifier({required TodoItemRepository todoItemRepository})
      : _todoItemRepository = todoItemRepository,
        super(const TodoListState());

  final TodoItemRepository _todoItemRepository;

  Future<void> init() async {
    state = state.copyWith(isFetching: true);
    final list = await _todoItemRepository.findAll();
    state = state.copyWith(todoList: list, isFetching: false);
  }

  Future<void> deleteItem({required String id}) async {
    await _todoItemRepository.deleteItem(id: id);
  }
}
