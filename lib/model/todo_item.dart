import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';
part 'todo_item.g.dart';

@freezed
class TodoItem with _$TodoItem {
  factory TodoItem({
    String? id,
    required String title,
    required String detail,
    @Default(false) bool isDone,
  }) = _TodoItem;

  factory TodoItem.fromJson(Map<String, dynamic> json) =>
      _$TodoItemFromJson(json);

  factory TodoItem.initialize() => TodoItem(id: null,title: "", detail: "");
}
