import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/common/random_str.dart';
import 'package:todoapp_sample_riverpod/model/todo_item.dart';

final todoItemRepository = Provider((ref) => TodoItemRepository());

class TodoItemRepository {
  final _db = FirebaseFirestore.instance;

  Future<void> create({required String title, required String detail}) async {
    final collectionRef = _db.collection('todo_item');
    final String documentId = generateNonce();
    await collectionRef.doc(documentId).set({
      'id': documentId,
      'title': title,
      'detail': detail,
      'isDone': false,
    });
  }

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

  Future<TodoItem> detailUpdate({
    required TodoItem item,
    required String detail,
  }) async {
    final collectionRef = _db.collection('todo_item');
    final updateDocument = collectionRef.doc(item.id);
    updateDocument.update({'detail': detail});
    final updateItem = await updateDocument.get();
    return TodoItem(
        id: updateItem['id'],
        title: updateItem['title'],
        detail: updateItem['detail'],
        isDone: updateItem['isDone']);
  }

  Future<TodoItem> titleUpdate({
    required TodoItem item,
    required String title,
  }) async {
    final collectionRef = _db.collection('todo_item');
    final updateDocument = collectionRef.doc(item.id);
    updateDocument.update({'title': title});
    final updateItem = await updateDocument.get();
    return TodoItem(
        id: updateItem['id'],
        title: updateItem['title'],
        detail: updateItem['detail'],
        isDone: updateItem['isDone']);
  }

  Future<void> boxClick({required String id, required bool? isDone}) async {
    final collectionRef = _db.collection('todo_item');
    await collectionRef.doc(id).update({'isDone': isDone!});
  }

  Future<void> delete({required String id}) async {
    final documentRef = _db.collection('todo_item').doc(id);
    return documentRef.delete();
  }
}
