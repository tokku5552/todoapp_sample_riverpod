import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapp_sample_riverpod/model/todo_item.dart';

part 'todo_detail_state.freezed.dart';

@freezed
class TodoDetailState with _$TodoDetailState {
  const factory TodoDetailState({
    @Default(false) bool isFetching,
    TodoItem? todoItem,
  }) = _TodoDetailState;
}
