import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_detail/todo_detail_notifier.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_list/todo_list_notifier.dart';

class TodoListDetailPage extends ConsumerWidget {
  const TodoListDetailPage({required this.newTodo, Key? key}) : super(key: key);
  final bool newTodo;

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
                          text: newTodo ? null : state.todoItem?.title),
                      decoration:
                          InputDecoration(hintText: newTodo ? '明日9時会議' : null),
                      onChanged: (String value) {
                        newTodo
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
                      child: Text(newTodo ? '新規作成' : '更新'),
                      onPressed: () {
                        newTodo
                            ? notifier.newItem(
                                title: newTitle, detail: newDetail)
                            : notifier.itemDetail(state.todoItem!.id);
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
                    text: newTodo ? null : state.todoItem?.detail),
                decoration: InputDecoration(
                  hintText: newTodo ? '例：大西さんと京都駅の大山オフィスにて会議' : null,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (String value) {
                  newTodo
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
