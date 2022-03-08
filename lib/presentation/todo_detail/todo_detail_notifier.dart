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

  Future<void> create({required String title, required String detail}) async {
    await _todoItemRepository.create(
      title: title,
      detail: detail,
    );
  }

  Future<void> updateItem({
    required TodoItem todoItem,
  }) async {
    await _todoItemRepository.update(
      item: todoItem,
    );
  }

  void changeTitle(String title) {
    state = state.copyWith(
      todoItem: TodoItem(
        id: state.todoItem!.id,
        title: title,
        detail: state.todoItem!.detail,
        isDone: state.todoItem!.isDone,
      ),
    );
  }

  void changeDetail(String detail) {
    state = state.copyWith(
      todoItem: TodoItem(
        id: state.todoItem!.id,
        title: state.todoItem!.title,
        detail: detail,
        isDone: state.todoItem!.isDone,
      ),
    );
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

  Future<void> onPush(
    String title,
    String detail,
  ) async {
    if (state.todoItem != null) {
      changeTitle(title);
      changeDetail(detail);
      await updateItem(todoItem: state.todoItem!);
    } else {
      await create(title: title, detail: detail);
    }
  }

  Future<void> checkBox({required String id, required bool? isDone}) async {
    await _todoItemRepository.updateIsDone(id: id, isDone: isDone);
  }

  //下のコードはリファクタリングして、消す予定の仮のメソッドです。
  void cleanState() {
    state = state.copyWith(todoItem: null);
  }
}
