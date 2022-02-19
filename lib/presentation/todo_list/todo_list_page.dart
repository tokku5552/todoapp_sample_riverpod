import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_list/todo_list_notifier.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoListStateProvider);
    final notifier = ref.watch(todoListStateProvider.notifier);
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
                        // TODO: implement
                      },
                    ),
                    title: Text(item.title),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await notifier.init();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
