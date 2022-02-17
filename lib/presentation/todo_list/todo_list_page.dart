import 'package:flutter/material.dart';
import 'package:todoapp_sample_riverpod/common/test_data.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List Page'),
      ),
      body: ListView(
        children: getTestTodoList
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('hoge');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
