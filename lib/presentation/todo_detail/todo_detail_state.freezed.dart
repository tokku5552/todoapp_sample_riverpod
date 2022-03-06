// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoDetailStateTearOff {
  const _$TodoDetailStateTearOff();

  _TodoDetailState call({bool isFetching = false, TodoItem? todoItem}) {
    return _TodoDetailState(
      isFetching: isFetching,
      todoItem: todoItem,
    );
  }
}

/// @nodoc
const $TodoDetailState = _$TodoDetailStateTearOff();

/// @nodoc
mixin _$TodoDetailState {
  bool get isFetching => throw _privateConstructorUsedError;
  TodoItem? get todoItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoDetailStateCopyWith<TodoDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoDetailStateCopyWith<$Res> {
  factory $TodoDetailStateCopyWith(
          TodoDetailState value, $Res Function(TodoDetailState) then) =
      _$TodoDetailStateCopyWithImpl<$Res>;
  $Res call({bool isFetching, TodoItem? todoItem});

  $TodoItemCopyWith<$Res>? get todoItem;
}

/// @nodoc
class _$TodoDetailStateCopyWithImpl<$Res>
    implements $TodoDetailStateCopyWith<$Res> {
  _$TodoDetailStateCopyWithImpl(this._value, this._then);

  final TodoDetailState _value;
  // ignore: unused_field
  final $Res Function(TodoDetailState) _then;

  @override
  $Res call({
    Object? isFetching = freezed,
    Object? todoItem = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      todoItem: todoItem == freezed
          ? _value.todoItem
          : todoItem // ignore: cast_nullable_to_non_nullable
              as TodoItem?,
    ));
  }

  @override
  $TodoItemCopyWith<$Res>? get todoItem {
    if (_value.todoItem == null) {
      return null;
    }

    return $TodoItemCopyWith<$Res>(_value.todoItem!, (value) {
      return _then(_value.copyWith(todoItem: value));
    });
  }
}

/// @nodoc
abstract class _$TodoDetailStateCopyWith<$Res>
    implements $TodoDetailStateCopyWith<$Res> {
  factory _$TodoDetailStateCopyWith(
          _TodoDetailState value, $Res Function(_TodoDetailState) then) =
      __$TodoDetailStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isFetching, TodoItem? todoItem});

  @override
  $TodoItemCopyWith<$Res>? get todoItem;
}

/// @nodoc
class __$TodoDetailStateCopyWithImpl<$Res>
    extends _$TodoDetailStateCopyWithImpl<$Res>
    implements _$TodoDetailStateCopyWith<$Res> {
  __$TodoDetailStateCopyWithImpl(
      _TodoDetailState _value, $Res Function(_TodoDetailState) _then)
      : super(_value, (v) => _then(v as _TodoDetailState));

  @override
  _TodoDetailState get _value => super._value as _TodoDetailState;

  @override
  $Res call({
    Object? isFetching = freezed,
    Object? todoItem = freezed,
  }) {
    return _then(_TodoDetailState(
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      todoItem: todoItem == freezed
          ? _value.todoItem
          : todoItem // ignore: cast_nullable_to_non_nullable
              as TodoItem?,
    ));
  }
}

/// @nodoc

class _$_TodoDetailState implements _TodoDetailState {
  const _$_TodoDetailState({this.isFetching = false, this.todoItem});

  @JsonKey(defaultValue: false)
  @override
  final bool isFetching;
  @override
  final TodoItem? todoItem;

  @override
  String toString() {
    return 'TodoDetailState(isFetching: $isFetching, todoItem: $todoItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoDetailState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.todoItem, todoItem) ||
                other.todoItem == todoItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFetching, todoItem);

  @JsonKey(ignore: true)
  @override
  _$TodoDetailStateCopyWith<_TodoDetailState> get copyWith =>
      __$TodoDetailStateCopyWithImpl<_TodoDetailState>(this, _$identity);
}

abstract class _TodoDetailState implements TodoDetailState {
  const factory _TodoDetailState({bool isFetching, TodoItem? todoItem}) =
      _$_TodoDetailState;

  @override
  bool get isFetching;
  @override
  TodoItem? get todoItem;
  @override
  @JsonKey(ignore: true)
  _$TodoDetailStateCopyWith<_TodoDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
