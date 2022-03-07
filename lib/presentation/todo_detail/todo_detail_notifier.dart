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
    await _todoItemRepository.create(title: title, detail: detail);
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

  Future<void> updateDetail({
    required TodoItem item,
    required String detail,
  }) async {
    await _todoItemRepository.detailUpdate(
      item: item,
      detail: detail,
    );
  }

  Future<void> checkBox({required String id, required bool? isDone}) async {
    await _todoItemRepository.boxClick(id: id, isDone: isDone);
  }

  Future<void> updateTitle({
    required TodoItem item,
    required String title,
  }) async {
    await _todoItemRepository.titleUpdate(
      item: item,
      title: title,
    );
  }
}
