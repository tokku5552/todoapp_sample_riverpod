// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoItem _$$_TodoItemFromJson(Map<String, dynamic> json) => _$_TodoItem(
      id: json['id'] as String?,
      title: json['title'] as String,
      detail: json['detail'] as String,
      isDone: json['isDone'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TodoItemToJson(_$_TodoItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'detail': instance.detail,
      'isDone': instance.isDone,
    };
