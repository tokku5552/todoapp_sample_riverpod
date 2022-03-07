import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';

@freezed
class TodoItem with _$TodoItem {
  factory TodoItem({
    String? id,
    required String title,
    required String detail,
    required bool isDone,
  }) = _TodoItem;
}
