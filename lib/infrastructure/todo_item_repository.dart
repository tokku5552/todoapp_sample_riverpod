import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/model/todo_item.dart';

final todoItemRepository = Provider((ref) => TodoItemRepository());

class TodoItemRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<TodoItem>> findAll() async {
    final collectionRef = _db.collection('todo_item');
    final querySnapshot = await collectionRef.get();
    return querySnapshot.docs
        .map(
          (item) => TodoItem(
            id: item['id'],
            title: item['title'],
            detail: item['detail'],
            isDone: item['isDone'],
          ),
        )
        .toList();
  }

  Future<TodoItem> findById({required String id}) async {
    final collectionRef = _db.collection('todo_item');
    final item = await collectionRef.doc(id).get();
    return TodoItem(
        id: item['id'],
        title: item['title'],
        detail: item['detail'],
        isDone: item['isDone']);
  }

  Future<void> create({required TodoItem item}) async {
    // TODO: implement
  }

  Future<void> update({required TodoItem item}) async {
    // TODO: implement
  }

  Future<void> delete({required TodoItem item}) async {
    // TODO: implement
  }
}
