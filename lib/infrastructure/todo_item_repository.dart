import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/model/todo_item.dart';

final todoItemRepository = Provider((ref) => TodoItemRepository());

class TodoItemRepository {
  final _db = FirebaseFirestore.instance;

  Future<String> create({required TodoItem item}) async {
    final collectionRef = _db.collection('todo_item');
    final newDoc = collectionRef.doc();
    await newDoc.set({
      'id': newDoc.id,
      'title': item.title,
      'detail': item.detail,
      'isDone': item.isDone,
    });
    return newDoc.id;
  }

  Future<List<TodoItem>> findAll() async {
    final collectionRef = _db.collection('todo_item');
    final querySnapshot = await collectionRef.get();
    return querySnapshot.docs
        .map(
          (item) => TodoItem.fromJson(item.data()),
        )
        .toList();
  }

  Future<TodoItem> findById({required String id}) async {
    final collectionRef = _db.collection('todo_item');
    final item = await collectionRef.doc(id).get();
    return TodoItem.fromJson(item.data()!);
  }

  Future<void> update({
    required TodoItem item,
  }) async {
    final collectionRef = _db.collection('todo_item');
    final documentRef = collectionRef.doc(item.id);
    await documentRef.update(item.toJson());
  }

  Future<void> updateIsDone({required String id, required bool? isDone}) async {
    final collectionRef = _db.collection('todo_item');
    await collectionRef.doc(id).update({'isDone': isDone!});
  }

  Future<void> deleteItem({required String id}) async {
    final documentRef = _db.collection('todo_item').doc(id);
    documentRef.delete();
  }
}
