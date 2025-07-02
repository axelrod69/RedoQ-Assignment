// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'taskState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskState {
  List<TaskModel>? get allList => throw _privateConstructorUsedError;
  List<TaskModel>? get taskList => throw _privateConstructorUsedError;
  List<TaskModel>? get inProgressList => throw _privateConstructorUsedError;
  List<TaskModel>? get completedList => throw _privateConstructorUsedError;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskStateCopyWith<TaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStateCopyWith<$Res> {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) then) =
      _$TaskStateCopyWithImpl<$Res, TaskState>;
  @useResult
  $Res call(
      {List<TaskModel>? allList,
      List<TaskModel>? taskList,
      List<TaskModel>? inProgressList,
      List<TaskModel>? completedList});
}

/// @nodoc
class _$TaskStateCopyWithImpl<$Res, $Val extends TaskState>
    implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allList = freezed,
    Object? taskList = freezed,
    Object? inProgressList = freezed,
    Object? completedList = freezed,
  }) {
    return _then(_value.copyWith(
      allList: freezed == allList
          ? _value.allList
          : allList // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      taskList: freezed == taskList
          ? _value.taskList
          : taskList // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      inProgressList: freezed == inProgressList
          ? _value.inProgressList
          : inProgressList // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      completedList: freezed == completedList
          ? _value.completedList
          : completedList // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskStateImplCopyWith<$Res>
    implements $TaskStateCopyWith<$Res> {
  factory _$$TaskStateImplCopyWith(
          _$TaskStateImpl value, $Res Function(_$TaskStateImpl) then) =
      __$$TaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TaskModel>? allList,
      List<TaskModel>? taskList,
      List<TaskModel>? inProgressList,
      List<TaskModel>? completedList});
}

/// @nodoc
class __$$TaskStateImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskStateImpl>
    implements _$$TaskStateImplCopyWith<$Res> {
  __$$TaskStateImplCopyWithImpl(
      _$TaskStateImpl _value, $Res Function(_$TaskStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allList = freezed,
    Object? taskList = freezed,
    Object? inProgressList = freezed,
    Object? completedList = freezed,
  }) {
    return _then(_$TaskStateImpl(
      allList: freezed == allList
          ? _value._allList
          : allList // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      taskList: freezed == taskList
          ? _value._taskList
          : taskList // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      inProgressList: freezed == inProgressList
          ? _value._inProgressList
          : inProgressList // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      completedList: freezed == completedList
          ? _value._completedList
          : completedList // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
    ));
  }
}

/// @nodoc

class _$TaskStateImpl implements _TaskState {
  _$TaskStateImpl(
      {final List<TaskModel>? allList,
      final List<TaskModel>? taskList,
      final List<TaskModel>? inProgressList,
      final List<TaskModel>? completedList})
      : _allList = allList,
        _taskList = taskList,
        _inProgressList = inProgressList,
        _completedList = completedList;

  final List<TaskModel>? _allList;
  @override
  List<TaskModel>? get allList {
    final value = _allList;
    if (value == null) return null;
    if (_allList is EqualUnmodifiableListView) return _allList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TaskModel>? _taskList;
  @override
  List<TaskModel>? get taskList {
    final value = _taskList;
    if (value == null) return null;
    if (_taskList is EqualUnmodifiableListView) return _taskList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TaskModel>? _inProgressList;
  @override
  List<TaskModel>? get inProgressList {
    final value = _inProgressList;
    if (value == null) return null;
    if (_inProgressList is EqualUnmodifiableListView) return _inProgressList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TaskModel>? _completedList;
  @override
  List<TaskModel>? get completedList {
    final value = _completedList;
    if (value == null) return null;
    if (_completedList is EqualUnmodifiableListView) return _completedList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TaskState(allList: $allList, taskList: $taskList, inProgressList: $inProgressList, completedList: $completedList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskStateImpl &&
            const DeepCollectionEquality().equals(other._allList, _allList) &&
            const DeepCollectionEquality().equals(other._taskList, _taskList) &&
            const DeepCollectionEquality()
                .equals(other._inProgressList, _inProgressList) &&
            const DeepCollectionEquality()
                .equals(other._completedList, _completedList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allList),
      const DeepCollectionEquality().hash(_taskList),
      const DeepCollectionEquality().hash(_inProgressList),
      const DeepCollectionEquality().hash(_completedList));

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskStateImplCopyWith<_$TaskStateImpl> get copyWith =>
      __$$TaskStateImplCopyWithImpl<_$TaskStateImpl>(this, _$identity);
}

abstract class _TaskState implements TaskState {
  factory _TaskState(
      {final List<TaskModel>? allList,
      final List<TaskModel>? taskList,
      final List<TaskModel>? inProgressList,
      final List<TaskModel>? completedList}) = _$TaskStateImpl;

  @override
  List<TaskModel>? get allList;
  @override
  List<TaskModel>? get taskList;
  @override
  List<TaskModel>? get inProgressList;
  @override
  List<TaskModel>? get completedList;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskStateImplCopyWith<_$TaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
