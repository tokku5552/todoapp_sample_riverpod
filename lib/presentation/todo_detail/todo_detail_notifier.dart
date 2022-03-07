import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/infrastructure/todo_item_repository.dart';
import 'package:todoapp_sample_riverpod/model/todo_item.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_detail/todo_detail_state.dart';

final todoDetailStateProvider =
    StateNotifierProvider<TodoDetailNotifier, TodoDetailState>(
  (ref) => TodoDetailNotifier(
    todoItemRepository: ref.read(todoItemRepository),
  ),
);

class TodoDetailNotifier extends StateNotifier<TodoDetailState> {
  TodoDetailNotifier({required TodoItemRepository todoItemRepository})
      : _todoItemRepository = todoItemRepository,
        super(const TodoDetailState());

  final TodoItemRepository _todoItemRepository;

  Future<void> createTodoItem({
    required String title,
    required String detail,
  }) async {
    await _todoItemRepository.createItem(title: title, detail: detail);
  }

  Future<void> passTodoItemId({required String itemId}) async {
    state = state.copyWith(isFetching: true);
    final item = await _todoItemRepository.findById(id: itemId);
    state = state.copyWith(todoItem: item, isFetching: false);
  }

  Future<void> itemDetail({required String itemId}) async {
    state = state.copyWith(isFetching: true);
    final item = await _todoItemRepository.findById(id: itemId);
    state = state.copyWith(todoItem: item, isFetching: false);
  }

  Future<void> updateItem({
    required TodoItem todoItem,
    required String? todoTitle,
    required String? todoDetail,
  }) async {
    await _todoItemRepository.updateTitleAndDetail(
      item: todoItem,
      title: todoTitle,
      detail: todoDetail,
    );
  }

  Future<void> checkBox({required String id, required bool? isDone}) async {
    await _todoItemRepository.updateIsDone(id: id, isDone: isDone);
  }
}
