import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_sample_riverpod/model/todo_item.dart';

final todoItemRepository = Provider((ref) => TodoItemRepository());

class TodoItemRepository {
  final _db = FirebaseFirestore.instance;

  Future<String> create(
      {required TodoItem item, required String userId}) async {
    final collectionRef = _db.collection('users');
    final newDoc = collectionRef.doc(userId).collection('todo_item').doc();
    await newDoc.set({
      'id': newDoc.id,
      'title': item.title,
      'detail': item.detail,
      'isDone': item.isDone,
    });
    return newDoc.id;
  }

  Future<List<TodoItem>> findAll({required String userId}) async {
    final collectionRef = _db.collection('users');
    final querySnapshot =
        await collectionRef.doc(userId).collection('todo_item').get();
    return querySnapshot.docs
        .map(
          (item) => TodoItem.fromJson(jsonFromSnapshot(item)),
        )
        .toList();
  }

  Future<TodoItem> findById({
    required String id,
    required String userId,
  }) async {
    final collectionRef = _db.collection('users');
    final item =
        await collectionRef.doc(userId).collection('todo_item').doc(id).get();
    return TodoItem.fromJson(item.data()!);
  }

  Future<void> update({
    required TodoItem item,
    required String userId,
  }) async {
    final collectionRef = _db.collection('users');
    final documentRef =
        collectionRef.doc(userId).collection('todo_item').doc(item.id);
    await documentRef.update(item.toJson());
  }

  Future<void> updateIsDone({
    required String id,
    required bool? isDone,
    required String userId,
  }) async {
    final collectionRef = _db.collection('users');
    await collectionRef
        .doc(userId)
        .collection('todo_item')
        .doc(id)
        .update({'isDone': isDone!});
  }

  Future<void> deleteItem({
    required String id,
    required String userId,
  }) async {
    final documentRef =
        _db.collection('users').doc(userId).collection('todo_item').doc(id);
    documentRef.delete();
  }

  Map<String, dynamic> jsonFromSnapshot<T extends DocumentSnapshot>(T json) {
    return {
      'id' : json.id,
      'title': json['title'],
      'detail': json['detail'],
      'isDone': json['isDone'],
    };
  }

}
