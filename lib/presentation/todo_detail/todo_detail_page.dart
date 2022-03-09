import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/model/todo_item.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_detail/todo_detail_notifier.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_list/todo_list_notifier.dart';

import 'widget.dart';

class TodoItemDetailModal extends ConsumerWidget {
  const TodoItemDetailModal({this.todoItem, Key? key}) : super(key: key);
  final TodoItem? todoItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoDetailStateProvider);
    final notifier = ref.watch(todoDetailStateProvider.notifier);
    final listNotifier = ref.watch(todoListStateProvider.notifier);
    final titleTextController = TextEditingController(
        text: todoItem == null ? null : state.todoItem?.title);
    final detailTextController = TextEditingController(
        text: todoItem == null ? null : state.todoItem?.detail);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: ReusableTextField(
                    textEditingController: titleTextController,
                    todoItem: todoItem,
                    margin: const EdgeInsets.fromLTRB(60, 0, 60, 20),
                    maxLines: 1,
                    minLines: 1,
                    fontSize: 25,
                    exampleSentence: '明日5時起床',
                    border: null,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 60, 20),
                  child: ElevatedButton(
                      child: Text(todoItem == null ? '新規作成' : '更新'),
                      onPressed: () async {
                        await notifier.onPush(
                            title: titleTextController.text,
                            detail: detailTextController.text);
                        listNotifier.init();
                        notifier.cleanState();
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
            ReusableTextField(
              textEditingController: detailTextController,
              todoItem: todoItem,
              margin: const EdgeInsets.fromLTRB(60, 0, 60, 140),
              maxLines: 10,
              minLines: 5,
              fontSize: 20,
              exampleSentence: '例：大西さんと京都駅の大山オフィスにて会議',
              border: const OutlineInputBorder(),
            ),
          ],
        ),
      ),
    );
  }
}
