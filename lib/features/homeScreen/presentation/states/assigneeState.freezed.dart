// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assigneeState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssigneeState {
  List<AssigneeModel>? get assigneeModel => throw _privateConstructorUsedError;

  /// Create a copy of AssigneeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssigneeStateCopyWith<AssigneeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssigneeStateCopyWith<$Res> {
  factory $AssigneeStateCopyWith(
          AssigneeState value, $Res Function(AssigneeState) then) =
      _$AssigneeStateCopyWithImpl<$Res, AssigneeState>;
  @useResult
  $Res call({List<AssigneeModel>? assigneeModel});
}

/// @nodoc
class _$AssigneeStateCopyWithImpl<$Res, $Val extends AssigneeState>
    implements $AssigneeStateCopyWith<$Res> {
  _$AssigneeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssigneeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assigneeModel = freezed,
  }) {
    return _then(_value.copyWith(
      assigneeModel: freezed == assigneeModel
          ? _value.assigneeModel
          : assigneeModel // ignore: cast_nullable_to_non_nullable
              as List<AssigneeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssigneeStateImplCopyWith<$Res>
    implements $AssigneeStateCopyWith<$Res> {
  factory _$$AssigneeStateImplCopyWith(
          _$AssigneeStateImpl value, $Res Function(_$AssigneeStateImpl) then) =
      __$$AssigneeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AssigneeModel>? assigneeModel});
}

/// @nodoc
class __$$AssigneeStateImplCopyWithImpl<$Res>
    extends _$AssigneeStateCopyWithImpl<$Res, _$AssigneeStateImpl>
    implements _$$AssigneeStateImplCopyWith<$Res> {
  __$$AssigneeStateImplCopyWithImpl(
      _$AssigneeStateImpl _value, $Res Function(_$AssigneeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssigneeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assigneeModel = freezed,
  }) {
    return _then(_$AssigneeStateImpl(
      assigneeModel: freezed == assigneeModel
          ? _value._assigneeModel
          : assigneeModel // ignore: cast_nullable_to_non_nullable
              as List<AssigneeModel>?,
    ));
  }
}

/// @nodoc

class _$AssigneeStateImpl implements _AssigneeState {
  _$AssigneeStateImpl({final List<AssigneeModel>? assigneeModel})
      : _assigneeModel = assigneeModel;

  final List<AssigneeModel>? _assigneeModel;
  @override
  List<AssigneeModel>? get assigneeModel {
    final value = _assigneeModel;
    if (value == null) return null;
    if (_assigneeModel is EqualUnmodifiableListView) return _assigneeModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AssigneeState(assigneeModel: $assigneeModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssigneeStateImpl &&
            const DeepCollectionEquality()
                .equals(other._assigneeModel, _assigneeModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_assigneeModel));

  /// Create a copy of AssigneeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssigneeStateImplCopyWith<_$AssigneeStateImpl> get copyWith =>
      __$$AssigneeStateImplCopyWithImpl<_$AssigneeStateImpl>(this, _$identity);
}

abstract class _AssigneeState implements AssigneeState {
  factory _AssigneeState({final List<AssigneeModel>? assigneeModel}) =
      _$AssigneeStateImpl;

  @override
  List<AssigneeModel>? get assigneeModel;

  /// Create a copy of AssigneeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssigneeStateImplCopyWith<_$AssigneeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
