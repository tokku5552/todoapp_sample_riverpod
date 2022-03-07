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
    final state = ref.watch(todoDetailStateProvider);
    final notifier = ref.watch(todoDetailStateProvider.notifier);
    final listNotifier = ref.watch(todoListStateProvider.notifier);
    final titleTextController =
        TextEditingController(text: newItemFlag ? null : state.todoItem?.title);
    final detailTextController = TextEditingController(
        text: newItemFlag ? null : state.todoItem?.detail);

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
                      controller: titleTextController,
                      decoration: InputDecoration(
                          hintText: newItemFlag ? '明日9時会議' : null),
                      onChanged: (String value) {
                        notifier.changeTitle(value);
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 60, 20),
                  child: ElevatedButton(
                      child: Text(newItemFlag ? '新規作成' : '更新'),
                      onPressed: () async {
                        await notifier.onPush();
                        Navigator.pop(context);
                        listNotifier.init();
                      }),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(60, 0, 60, 140),
              child: TextField(
                maxLines: 10,
                minLines: 5,
                controller: detailTextController,
                decoration: InputDecoration(
                  hintText: newItemFlag ? '例：大西さんと京都駅の大山オフィスにて会議' : null,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (String value) {
                  notifier.changeDetail(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
