import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/infrastructure/auth_repository.dart';
import 'package:todoapp_sample_riverpod/presentation/login_register/initial_page.dart';
import 'package:todoapp_sample_riverpod/presentation/todo_list/todo_list_page.dart';


class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authStateProvider);
    return _authState.when(
        data: (data) {
          if (data != null) {
            return const TodoListPage();
          }
          return const InitialPage();
        },
        error: (e, trace) => const CircularProgressIndicator(),
        loading: () => const CircularProgressIndicator());
  }
}
