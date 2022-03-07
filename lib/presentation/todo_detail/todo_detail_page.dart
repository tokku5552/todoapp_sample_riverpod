import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_detail/todo_detail_notifier.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_list/todo_list_notifier.dart';

class TodoItemDetailModal extends ConsumerWidget {
  const TodoItemDetailModal({required this.newItemFlag, Key? key})
      : super(key: key);
  final bool newItemFlag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String newTitle = '';
    String newDetail = '';
    final state = ref.watch(todoDetailStateProvider);
    final notifier = ref.watch(todoDetailStateProvider.notifier);
    final listNotifier = ref.watch(todoListStateProvider.notifier);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(60, 0, 60, 20),
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                      controller: TextEditingController(
                          text: newItemFlag ? null : state.todoItem?.title),
                      decoration: InputDecoration(
                          hintText: newItemFlag ? '明日9時会議' : null),
                      onChanged: (String value) {
                        newItemFlag
                            ? newTitle = value
                            : notifier.updateTitle(
                                item: state.todoItem!, title: value);
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 60, 20),
                  child: ElevatedButton(
                      child: Text(newItemFlag ? '新規作成' : '更新'),
                      onPressed: () {
                        newItemFlag
                            ? notifier.createTodoItem(
                                title: newTitle, detail: newDetail)
                            : notifier.itemDetail(itemId: state.todoItem!.id);
                        Navigator.pop(context);
                        listNotifier.init();
                      }),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(60, 0, 60, 200),
              child: TextField(
                maxLines: 10,
                minLines: 5,
                controller: TextEditingController(
                    text: newItemFlag ? null : state.todoItem?.detail),
                decoration: InputDecoration(
                  hintText: newItemFlag ? '例：大西さんと京都駅の大山オフィスにて会議' : null,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (String value) {
                  newItemFlag
                      ? newDetail = value
                      : notifier.updateDetail(
                          item: state.todoItem!, detail: value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
