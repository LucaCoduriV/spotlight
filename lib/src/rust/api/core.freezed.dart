// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EntityError {
  String get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EntityError_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EntityError_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EntityError_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EntityErrorCopyWith<EntityError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityErrorCopyWith<$Res> {
  factory $EntityErrorCopyWith(
          EntityError value, $Res Function(EntityError) then) =
      _$EntityErrorCopyWithImpl<$Res, EntityError>;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$EntityErrorCopyWithImpl<$Res, $Val extends EntityError>
    implements $EntityErrorCopyWith<$Res> {
  _$EntityErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_value.copyWith(
      field0: null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntityError_UnknownImplCopyWith<$Res>
    implements $EntityErrorCopyWith<$Res> {
  factory _$$EntityError_UnknownImplCopyWith(_$EntityError_UnknownImpl value,
          $Res Function(_$EntityError_UnknownImpl) then) =
      __$$EntityError_UnknownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String field0});
}

/// @nodoc
class __$$EntityError_UnknownImplCopyWithImpl<$Res>
    extends _$EntityErrorCopyWithImpl<$Res, _$EntityError_UnknownImpl>
    implements _$$EntityError_UnknownImplCopyWith<$Res> {
  __$$EntityError_UnknownImplCopyWithImpl(_$EntityError_UnknownImpl _value,
      $Res Function(_$EntityError_UnknownImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$EntityError_UnknownImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EntityError_UnknownImpl implements EntityError_Unknown {
  const _$EntityError_UnknownImpl(this.field0);

  @override
  final String field0;

  @override
  String toString() {
    return 'EntityError.unknown(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityError_UnknownImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntityError_UnknownImplCopyWith<_$EntityError_UnknownImpl> get copyWith =>
      __$$EntityError_UnknownImplCopyWithImpl<_$EntityError_UnknownImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0) unknown,
  }) {
    return unknown(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? unknown,
  }) {
    return unknown?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EntityError_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EntityError_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EntityError_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class EntityError_Unknown implements EntityError {
  const factory EntityError_Unknown(final String field0) =
      _$EntityError_UnknownImpl;

  @override
  String get field0;
  @override
  @JsonKey(ignore: true)
  _$$EntityError_UnknownImplCopyWith<_$EntityError_UnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Image {
  Object get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uint8List field0) data,
    required TResult Function(String field0) path,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uint8List field0)? data,
    TResult? Function(String field0)? path,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uint8List field0)? data,
    TResult Function(String field0)? path,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Image_Data value) data,
    required TResult Function(Image_Path value) path,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Image_Data value)? data,
    TResult? Function(Image_Path value)? path,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Image_Data value)? data,
    TResult Function(Image_Path value)? path,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res, Image>;
}

/// @nodoc
class _$ImageCopyWithImpl<$Res, $Val extends Image>
    implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$Image_DataImplCopyWith<$Res> {
  factory _$$Image_DataImplCopyWith(
          _$Image_DataImpl value, $Res Function(_$Image_DataImpl) then) =
      __$$Image_DataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List field0});
}

/// @nodoc
class __$$Image_DataImplCopyWithImpl<$Res>
    extends _$ImageCopyWithImpl<$Res, _$Image_DataImpl>
    implements _$$Image_DataImplCopyWith<$Res> {
  __$$Image_DataImplCopyWithImpl(
      _$Image_DataImpl _value, $Res Function(_$Image_DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$Image_DataImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$Image_DataImpl implements Image_Data {
  const _$Image_DataImpl(this.field0);

  @override
  final Uint8List field0;

  @override
  String toString() {
    return 'Image.data(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Image_DataImpl &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Image_DataImplCopyWith<_$Image_DataImpl> get copyWith =>
      __$$Image_DataImplCopyWithImpl<_$Image_DataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uint8List field0) data,
    required TResult Function(String field0) path,
  }) {
    return data(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uint8List field0)? data,
    TResult? Function(String field0)? path,
  }) {
    return data?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uint8List field0)? data,
    TResult Function(String field0)? path,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Image_Data value) data,
    required TResult Function(Image_Path value) path,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Image_Data value)? data,
    TResult? Function(Image_Path value)? path,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Image_Data value)? data,
    TResult Function(Image_Path value)? path,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Image_Data implements Image {
  const factory Image_Data(final Uint8List field0) = _$Image_DataImpl;

  @override
  Uint8List get field0;
  @JsonKey(ignore: true)
  _$$Image_DataImplCopyWith<_$Image_DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Image_PathImplCopyWith<$Res> {
  factory _$$Image_PathImplCopyWith(
          _$Image_PathImpl value, $Res Function(_$Image_PathImpl) then) =
      __$$Image_PathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class __$$Image_PathImplCopyWithImpl<$Res>
    extends _$ImageCopyWithImpl<$Res, _$Image_PathImpl>
    implements _$$Image_PathImplCopyWith<$Res> {
  __$$Image_PathImplCopyWithImpl(
      _$Image_PathImpl _value, $Res Function(_$Image_PathImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$Image_PathImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Image_PathImpl implements Image_Path {
  const _$Image_PathImpl(this.field0);

  @override
  final String field0;

  @override
  String toString() {
    return 'Image.path(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Image_PathImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Image_PathImplCopyWith<_$Image_PathImpl> get copyWith =>
      __$$Image_PathImplCopyWithImpl<_$Image_PathImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uint8List field0) data,
    required TResult Function(String field0) path,
  }) {
    return path(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uint8List field0)? data,
    TResult? Function(String field0)? path,
  }) {
    return path?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uint8List field0)? data,
    TResult Function(String field0)? path,
    required TResult orElse(),
  }) {
    if (path != null) {
      return path(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Image_Data value) data,
    required TResult Function(Image_Path value) path,
  }) {
    return path(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Image_Data value)? data,
    TResult? Function(Image_Path value)? path,
  }) {
    return path?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Image_Data value)? data,
    TResult Function(Image_Path value)? path,
    required TResult orElse(),
  }) {
    if (path != null) {
      return path(this);
    }
    return orElse();
  }
}

abstract class Image_Path implements Image {
  const factory Image_Path(final String field0) = _$Image_PathImpl;

  @override
  String get field0;
  @JsonKey(ignore: true)
  _$$Image_PathImplCopyWith<_$Image_PathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
