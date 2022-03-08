import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_detail/todo_detail_notifier.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_detail/todo_detail_page.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_list/todo_list_notifier.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoListStateProvider);
    final notifier = ref.watch(todoListStateProvider.notifier);
    final detailNotifier = ref.watch(todoDetailStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List Page'),
      ),
      body: Stack(
        children: [
          Visibility(
            child: Container(
                color: Colors.black.withOpacity(0.1),
                child: const Center(child: CircularProgressIndicator())),
            visible: state.isFetching,
          ),
          ListView(
            children: state.todoList
                .map(
                  (item) => ListTile(
                    leading: Checkbox(
                      value: item.isDone,
                      onChanged: (bool? value) {
                        detailNotifier.checkBox(id: item.id!, isDone: value);
                        notifier.init();
                      },
                    ),
                    title: Text(item.title),
                    onTap: () {
                      detailNotifier.passTodoItemId(itemId: item.id!);
                      showModalBottomSheet(
                        useRootNavigator: true,
                        context: context,
                        builder: (BuildContext context) {
                          return TodoItemDetailModal(
                            todoItem: item,
                          );
                        },
                      );
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("Todoアイテムを削除"),
                            content: const Text("アイテムを削除しますか"),
                            actions: [
                              TextButton(
                                child: const Text("Cancel"),
                                onPressed: () => Navigator.pop(context),
                              ),
                              TextButton(
                                child: const Text("削除"),
                                onPressed: () {
                                  notifier.deleteItem(id: item.id!);
                                  notifier.init();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            useRootNavigator: true,
            context: context,
            builder: (BuildContext context) {
              return TodoItemDetailModal(
                todoItem: null,
              );
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
