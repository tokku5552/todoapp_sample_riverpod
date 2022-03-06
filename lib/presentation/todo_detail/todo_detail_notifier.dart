import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/infrastructure/todo_item_repository.dart';
import 'package:todoapp_sample_riverpod/model/todo_item.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_detail/todo_detail_state.dart';

final todoDetailStateProvider =
    StateNotifierProvider<TodoItemNotifier, TodoDetailState>(
  (ref) => TodoItemNotifier(
    todoItemRepository: ref.read(todoItemRepository),
  ),
);

class TodoItemNotifier extends StateNotifier<TodoDetailState> {
  TodoItemNotifier({required TodoItemRepository todoItemRepository})
      : _todoItemRepository = todoItemRepository,
        super(const TodoDetailState());

  final TodoItemRepository _todoItemRepository;

  Future<void> newItem({
    required String title,
    required String detail,
  }) async {
    await _todoItemRepository.create(title: title, detail: detail);
  }

  Future<void> passItem(String id) async {
    state = state.copyWith(isFetching: true);
    final item = await _todoItemRepository.findById(id: id);
    state = state.copyWith(todoItem: item, isFetching: false);
  }

  Future<void> itemDetail(String id) async {
    state = state.copyWith(isFetching: true);
    final item = await _todoItemRepository.findById(id: id);
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

  Future<bool?> boxBool(String id) async {
    final item = await _todoItemRepository.findById(id: id);
    itemDetail(id);
    return item.isDone;
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
