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
mixin _$BlazyrComponent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BlazyrComponent? child) container,
    required TResult Function(List<BlazyrComponent>? children) column,
    required TResult Function(List<BlazyrComponent>? children) row,
    required TResult Function(BlazyrComponent? child, String? onClick)
        clickable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent? child)? container,
    TResult? Function(List<BlazyrComponent>? children)? column,
    TResult? Function(List<BlazyrComponent>? children)? row,
    TResult? Function(BlazyrComponent? child, String? onClick)? clickable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BlazyrComponent? child)? container,
    TResult Function(List<BlazyrComponent>? children)? column,
    TResult Function(List<BlazyrComponent>? children)? row,
    TResult Function(BlazyrComponent? child, String? onClick)? clickable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlazyrComponent_Container value) container,
    required TResult Function(BlazyrComponent_Column value) column,
    required TResult Function(BlazyrComponent_Row value) row,
    required TResult Function(BlazyrComponent_Clickable value) clickable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent_Container value)? container,
    TResult? Function(BlazyrComponent_Column value)? column,
    TResult? Function(BlazyrComponent_Row value)? row,
    TResult? Function(BlazyrComponent_Clickable value)? clickable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlazyrComponent_Container value)? container,
    TResult Function(BlazyrComponent_Column value)? column,
    TResult Function(BlazyrComponent_Row value)? row,
    TResult Function(BlazyrComponent_Clickable value)? clickable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlazyrComponentCopyWith<$Res> {
  factory $BlazyrComponentCopyWith(
          BlazyrComponent value, $Res Function(BlazyrComponent) then) =
      _$BlazyrComponentCopyWithImpl<$Res, BlazyrComponent>;
}

/// @nodoc
class _$BlazyrComponentCopyWithImpl<$Res, $Val extends BlazyrComponent>
    implements $BlazyrComponentCopyWith<$Res> {
  _$BlazyrComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BlazyrComponent_ContainerImplCopyWith<$Res> {
  factory _$$BlazyrComponent_ContainerImplCopyWith(
          _$BlazyrComponent_ContainerImpl value,
          $Res Function(_$BlazyrComponent_ContainerImpl) then) =
      __$$BlazyrComponent_ContainerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BlazyrComponent? child});

  $BlazyrComponentCopyWith<$Res>? get child;
}

/// @nodoc
class __$$BlazyrComponent_ContainerImplCopyWithImpl<$Res>
    extends _$BlazyrComponentCopyWithImpl<$Res, _$BlazyrComponent_ContainerImpl>
    implements _$$BlazyrComponent_ContainerImplCopyWith<$Res> {
  __$$BlazyrComponent_ContainerImplCopyWithImpl(
      _$BlazyrComponent_ContainerImpl _value,
      $Res Function(_$BlazyrComponent_ContainerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? child = freezed,
  }) {
    return _then(_$BlazyrComponent_ContainerImpl(
      child: freezed == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as BlazyrComponent?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BlazyrComponentCopyWith<$Res>? get child {
    if (_value.child == null) {
      return null;
    }

    return $BlazyrComponentCopyWith<$Res>(_value.child!, (value) {
      return _then(_value.copyWith(child: value));
    });
  }
}

/// @nodoc

class _$BlazyrComponent_ContainerImpl implements BlazyrComponent_Container {
  const _$BlazyrComponent_ContainerImpl({this.child});

  @override
  final BlazyrComponent? child;

  @override
  String toString() {
    return 'BlazyrComponent.container(child: $child)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlazyrComponent_ContainerImpl &&
            (identical(other.child, child) || other.child == child));
  }

  @override
  int get hashCode => Object.hash(runtimeType, child);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlazyrComponent_ContainerImplCopyWith<_$BlazyrComponent_ContainerImpl>
      get copyWith => __$$BlazyrComponent_ContainerImplCopyWithImpl<
          _$BlazyrComponent_ContainerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BlazyrComponent? child) container,
    required TResult Function(List<BlazyrComponent>? children) column,
    required TResult Function(List<BlazyrComponent>? children) row,
    required TResult Function(BlazyrComponent? child, String? onClick)
        clickable,
  }) {
    return container(child);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent? child)? container,
    TResult? Function(List<BlazyrComponent>? children)? column,
    TResult? Function(List<BlazyrComponent>? children)? row,
    TResult? Function(BlazyrComponent? child, String? onClick)? clickable,
  }) {
    return container?.call(child);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BlazyrComponent? child)? container,
    TResult Function(List<BlazyrComponent>? children)? column,
    TResult Function(List<BlazyrComponent>? children)? row,
    TResult Function(BlazyrComponent? child, String? onClick)? clickable,
    required TResult orElse(),
  }) {
    if (container != null) {
      return container(child);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlazyrComponent_Container value) container,
    required TResult Function(BlazyrComponent_Column value) column,
    required TResult Function(BlazyrComponent_Row value) row,
    required TResult Function(BlazyrComponent_Clickable value) clickable,
  }) {
    return container(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent_Container value)? container,
    TResult? Function(BlazyrComponent_Column value)? column,
    TResult? Function(BlazyrComponent_Row value)? row,
    TResult? Function(BlazyrComponent_Clickable value)? clickable,
  }) {
    return container?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlazyrComponent_Container value)? container,
    TResult Function(BlazyrComponent_Column value)? column,
    TResult Function(BlazyrComponent_Row value)? row,
    TResult Function(BlazyrComponent_Clickable value)? clickable,
    required TResult orElse(),
  }) {
    if (container != null) {
      return container(this);
    }
    return orElse();
  }
}

abstract class BlazyrComponent_Container implements BlazyrComponent {
  const factory BlazyrComponent_Container({final BlazyrComponent? child}) =
      _$BlazyrComponent_ContainerImpl;

  BlazyrComponent? get child;
  @JsonKey(ignore: true)
  _$$BlazyrComponent_ContainerImplCopyWith<_$BlazyrComponent_ContainerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BlazyrComponent_ColumnImplCopyWith<$Res> {
  factory _$$BlazyrComponent_ColumnImplCopyWith(
          _$BlazyrComponent_ColumnImpl value,
          $Res Function(_$BlazyrComponent_ColumnImpl) then) =
      __$$BlazyrComponent_ColumnImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BlazyrComponent>? children});
}

/// @nodoc
class __$$BlazyrComponent_ColumnImplCopyWithImpl<$Res>
    extends _$BlazyrComponentCopyWithImpl<$Res, _$BlazyrComponent_ColumnImpl>
    implements _$$BlazyrComponent_ColumnImplCopyWith<$Res> {
  __$$BlazyrComponent_ColumnImplCopyWithImpl(
      _$BlazyrComponent_ColumnImpl _value,
      $Res Function(_$BlazyrComponent_ColumnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = freezed,
  }) {
    return _then(_$BlazyrComponent_ColumnImpl(
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<BlazyrComponent>?,
    ));
  }
}

/// @nodoc

class _$BlazyrComponent_ColumnImpl implements BlazyrComponent_Column {
  const _$BlazyrComponent_ColumnImpl({final List<BlazyrComponent>? children})
      : _children = children;

  final List<BlazyrComponent>? _children;
  @override
  List<BlazyrComponent>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BlazyrComponent.column(children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlazyrComponent_ColumnImpl &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlazyrComponent_ColumnImplCopyWith<_$BlazyrComponent_ColumnImpl>
      get copyWith => __$$BlazyrComponent_ColumnImplCopyWithImpl<
          _$BlazyrComponent_ColumnImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BlazyrComponent? child) container,
    required TResult Function(List<BlazyrComponent>? children) column,
    required TResult Function(List<BlazyrComponent>? children) row,
    required TResult Function(BlazyrComponent? child, String? onClick)
        clickable,
  }) {
    return column(children);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent? child)? container,
    TResult? Function(List<BlazyrComponent>? children)? column,
    TResult? Function(List<BlazyrComponent>? children)? row,
    TResult? Function(BlazyrComponent? child, String? onClick)? clickable,
  }) {
    return column?.call(children);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BlazyrComponent? child)? container,
    TResult Function(List<BlazyrComponent>? children)? column,
    TResult Function(List<BlazyrComponent>? children)? row,
    TResult Function(BlazyrComponent? child, String? onClick)? clickable,
    required TResult orElse(),
  }) {
    if (column != null) {
      return column(children);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlazyrComponent_Container value) container,
    required TResult Function(BlazyrComponent_Column value) column,
    required TResult Function(BlazyrComponent_Row value) row,
    required TResult Function(BlazyrComponent_Clickable value) clickable,
  }) {
    return column(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent_Container value)? container,
    TResult? Function(BlazyrComponent_Column value)? column,
    TResult? Function(BlazyrComponent_Row value)? row,
    TResult? Function(BlazyrComponent_Clickable value)? clickable,
  }) {
    return column?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlazyrComponent_Container value)? container,
    TResult Function(BlazyrComponent_Column value)? column,
    TResult Function(BlazyrComponent_Row value)? row,
    TResult Function(BlazyrComponent_Clickable value)? clickable,
    required TResult orElse(),
  }) {
    if (column != null) {
      return column(this);
    }
    return orElse();
  }
}

abstract class BlazyrComponent_Column implements BlazyrComponent {
  const factory BlazyrComponent_Column(
      {final List<BlazyrComponent>? children}) = _$BlazyrComponent_ColumnImpl;

  List<BlazyrComponent>? get children;
  @JsonKey(ignore: true)
  _$$BlazyrComponent_ColumnImplCopyWith<_$BlazyrComponent_ColumnImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BlazyrComponent_RowImplCopyWith<$Res> {
  factory _$$BlazyrComponent_RowImplCopyWith(_$BlazyrComponent_RowImpl value,
          $Res Function(_$BlazyrComponent_RowImpl) then) =
      __$$BlazyrComponent_RowImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BlazyrComponent>? children});
}

/// @nodoc
class __$$BlazyrComponent_RowImplCopyWithImpl<$Res>
    extends _$BlazyrComponentCopyWithImpl<$Res, _$BlazyrComponent_RowImpl>
    implements _$$BlazyrComponent_RowImplCopyWith<$Res> {
  __$$BlazyrComponent_RowImplCopyWithImpl(_$BlazyrComponent_RowImpl _value,
      $Res Function(_$BlazyrComponent_RowImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = freezed,
  }) {
    return _then(_$BlazyrComponent_RowImpl(
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<BlazyrComponent>?,
    ));
  }
}

/// @nodoc

class _$BlazyrComponent_RowImpl implements BlazyrComponent_Row {
  const _$BlazyrComponent_RowImpl({final List<BlazyrComponent>? children})
      : _children = children;

  final List<BlazyrComponent>? _children;
  @override
  List<BlazyrComponent>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BlazyrComponent.row(children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlazyrComponent_RowImpl &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlazyrComponent_RowImplCopyWith<_$BlazyrComponent_RowImpl> get copyWith =>
      __$$BlazyrComponent_RowImplCopyWithImpl<_$BlazyrComponent_RowImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BlazyrComponent? child) container,
    required TResult Function(List<BlazyrComponent>? children) column,
    required TResult Function(List<BlazyrComponent>? children) row,
    required TResult Function(BlazyrComponent? child, String? onClick)
        clickable,
  }) {
    return row(children);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent? child)? container,
    TResult? Function(List<BlazyrComponent>? children)? column,
    TResult? Function(List<BlazyrComponent>? children)? row,
    TResult? Function(BlazyrComponent? child, String? onClick)? clickable,
  }) {
    return row?.call(children);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BlazyrComponent? child)? container,
    TResult Function(List<BlazyrComponent>? children)? column,
    TResult Function(List<BlazyrComponent>? children)? row,
    TResult Function(BlazyrComponent? child, String? onClick)? clickable,
    required TResult orElse(),
  }) {
    if (row != null) {
      return row(children);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlazyrComponent_Container value) container,
    required TResult Function(BlazyrComponent_Column value) column,
    required TResult Function(BlazyrComponent_Row value) row,
    required TResult Function(BlazyrComponent_Clickable value) clickable,
  }) {
    return row(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent_Container value)? container,
    TResult? Function(BlazyrComponent_Column value)? column,
    TResult? Function(BlazyrComponent_Row value)? row,
    TResult? Function(BlazyrComponent_Clickable value)? clickable,
  }) {
    return row?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlazyrComponent_Container value)? container,
    TResult Function(BlazyrComponent_Column value)? column,
    TResult Function(BlazyrComponent_Row value)? row,
    TResult Function(BlazyrComponent_Clickable value)? clickable,
    required TResult orElse(),
  }) {
    if (row != null) {
      return row(this);
    }
    return orElse();
  }
}

abstract class BlazyrComponent_Row implements BlazyrComponent {
  const factory BlazyrComponent_Row({final List<BlazyrComponent>? children}) =
      _$BlazyrComponent_RowImpl;

  List<BlazyrComponent>? get children;
  @JsonKey(ignore: true)
  _$$BlazyrComponent_RowImplCopyWith<_$BlazyrComponent_RowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BlazyrComponent_ClickableImplCopyWith<$Res> {
  factory _$$BlazyrComponent_ClickableImplCopyWith(
          _$BlazyrComponent_ClickableImpl value,
          $Res Function(_$BlazyrComponent_ClickableImpl) then) =
      __$$BlazyrComponent_ClickableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BlazyrComponent? child, String? onClick});

  $BlazyrComponentCopyWith<$Res>? get child;
}

/// @nodoc
class __$$BlazyrComponent_ClickableImplCopyWithImpl<$Res>
    extends _$BlazyrComponentCopyWithImpl<$Res, _$BlazyrComponent_ClickableImpl>
    implements _$$BlazyrComponent_ClickableImplCopyWith<$Res> {
  __$$BlazyrComponent_ClickableImplCopyWithImpl(
      _$BlazyrComponent_ClickableImpl _value,
      $Res Function(_$BlazyrComponent_ClickableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? child = freezed,
    Object? onClick = freezed,
  }) {
    return _then(_$BlazyrComponent_ClickableImpl(
      child: freezed == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as BlazyrComponent?,
      onClick: freezed == onClick
          ? _value.onClick
          : onClick // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BlazyrComponentCopyWith<$Res>? get child {
    if (_value.child == null) {
      return null;
    }

    return $BlazyrComponentCopyWith<$Res>(_value.child!, (value) {
      return _then(_value.copyWith(child: value));
    });
  }
}

/// @nodoc

class _$BlazyrComponent_ClickableImpl implements BlazyrComponent_Clickable {
  const _$BlazyrComponent_ClickableImpl({this.child, this.onClick});

  @override
  final BlazyrComponent? child;
  @override
  final String? onClick;

  @override
  String toString() {
    return 'BlazyrComponent.clickable(child: $child, onClick: $onClick)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlazyrComponent_ClickableImpl &&
            (identical(other.child, child) || other.child == child) &&
            (identical(other.onClick, onClick) || other.onClick == onClick));
  }

  @override
  int get hashCode => Object.hash(runtimeType, child, onClick);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlazyrComponent_ClickableImplCopyWith<_$BlazyrComponent_ClickableImpl>
      get copyWith => __$$BlazyrComponent_ClickableImplCopyWithImpl<
          _$BlazyrComponent_ClickableImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BlazyrComponent? child) container,
    required TResult Function(List<BlazyrComponent>? children) column,
    required TResult Function(List<BlazyrComponent>? children) row,
    required TResult Function(BlazyrComponent? child, String? onClick)
        clickable,
  }) {
    return clickable(child, onClick);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent? child)? container,
    TResult? Function(List<BlazyrComponent>? children)? column,
    TResult? Function(List<BlazyrComponent>? children)? row,
    TResult? Function(BlazyrComponent? child, String? onClick)? clickable,
  }) {
    return clickable?.call(child, onClick);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BlazyrComponent? child)? container,
    TResult Function(List<BlazyrComponent>? children)? column,
    TResult Function(List<BlazyrComponent>? children)? row,
    TResult Function(BlazyrComponent? child, String? onClick)? clickable,
    required TResult orElse(),
  }) {
    if (clickable != null) {
      return clickable(child, onClick);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlazyrComponent_Container value) container,
    required TResult Function(BlazyrComponent_Column value) column,
    required TResult Function(BlazyrComponent_Row value) row,
    required TResult Function(BlazyrComponent_Clickable value) clickable,
  }) {
    return clickable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent_Container value)? container,
    TResult? Function(BlazyrComponent_Column value)? column,
    TResult? Function(BlazyrComponent_Row value)? row,
    TResult? Function(BlazyrComponent_Clickable value)? clickable,
  }) {
    return clickable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlazyrComponent_Container value)? container,
    TResult Function(BlazyrComponent_Column value)? column,
    TResult Function(BlazyrComponent_Row value)? row,
    TResult Function(BlazyrComponent_Clickable value)? clickable,
    required TResult orElse(),
  }) {
    if (clickable != null) {
      return clickable(this);
    }
    return orElse();
  }
}

abstract class BlazyrComponent_Clickable implements BlazyrComponent {
  const factory BlazyrComponent_Clickable(
      {final BlazyrComponent? child,
      final String? onClick}) = _$BlazyrComponent_ClickableImpl;

  BlazyrComponent? get child;
  String? get onClick;
  @JsonKey(ignore: true)
  _$$BlazyrComponent_ClickableImplCopyWith<_$BlazyrComponent_ClickableImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BlazyrEntityActionResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BlazyrComponent field0) ui,
    required TResult Function(String field0) text,
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent field0)? ui,
    TResult? Function(String field0)? text,
    TResult? Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BlazyrComponent field0)? ui,
    TResult Function(String field0)? text,
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlazyrEntityActionResponse_Ui value) ui,
    required TResult Function(BlazyrEntityActionResponse_Text value) text,
    required TResult Function(BlazyrEntityActionResponse_None value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlazyrEntityActionResponse_Ui value)? ui,
    TResult? Function(BlazyrEntityActionResponse_Text value)? text,
    TResult? Function(BlazyrEntityActionResponse_None value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlazyrEntityActionResponse_Ui value)? ui,
    TResult Function(BlazyrEntityActionResponse_Text value)? text,
    TResult Function(BlazyrEntityActionResponse_None value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlazyrEntityActionResponseCopyWith<$Res> {
  factory $BlazyrEntityActionResponseCopyWith(BlazyrEntityActionResponse value,
          $Res Function(BlazyrEntityActionResponse) then) =
      _$BlazyrEntityActionResponseCopyWithImpl<$Res,
          BlazyrEntityActionResponse>;
}

/// @nodoc
class _$BlazyrEntityActionResponseCopyWithImpl<$Res,
        $Val extends BlazyrEntityActionResponse>
    implements $BlazyrEntityActionResponseCopyWith<$Res> {
  _$BlazyrEntityActionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BlazyrEntityActionResponse_UiImplCopyWith<$Res> {
  factory _$$BlazyrEntityActionResponse_UiImplCopyWith(
          _$BlazyrEntityActionResponse_UiImpl value,
          $Res Function(_$BlazyrEntityActionResponse_UiImpl) then) =
      __$$BlazyrEntityActionResponse_UiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BlazyrComponent field0});

  $BlazyrComponentCopyWith<$Res> get field0;
}

/// @nodoc
class __$$BlazyrEntityActionResponse_UiImplCopyWithImpl<$Res>
    extends _$BlazyrEntityActionResponseCopyWithImpl<$Res,
        _$BlazyrEntityActionResponse_UiImpl>
    implements _$$BlazyrEntityActionResponse_UiImplCopyWith<$Res> {
  __$$BlazyrEntityActionResponse_UiImplCopyWithImpl(
      _$BlazyrEntityActionResponse_UiImpl _value,
      $Res Function(_$BlazyrEntityActionResponse_UiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$BlazyrEntityActionResponse_UiImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as BlazyrComponent,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BlazyrComponentCopyWith<$Res> get field0 {
    return $BlazyrComponentCopyWith<$Res>(_value.field0, (value) {
      return _then(_value.copyWith(field0: value));
    });
  }
}

/// @nodoc

class _$BlazyrEntityActionResponse_UiImpl
    implements BlazyrEntityActionResponse_Ui {
  const _$BlazyrEntityActionResponse_UiImpl(this.field0);

  @override
  final BlazyrComponent field0;

  @override
  String toString() {
    return 'BlazyrEntityActionResponse.ui(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlazyrEntityActionResponse_UiImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlazyrEntityActionResponse_UiImplCopyWith<
          _$BlazyrEntityActionResponse_UiImpl>
      get copyWith => __$$BlazyrEntityActionResponse_UiImplCopyWithImpl<
          _$BlazyrEntityActionResponse_UiImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BlazyrComponent field0) ui,
    required TResult Function(String field0) text,
    required TResult Function() none,
  }) {
    return ui(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent field0)? ui,
    TResult? Function(String field0)? text,
    TResult? Function()? none,
  }) {
    return ui?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BlazyrComponent field0)? ui,
    TResult Function(String field0)? text,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (ui != null) {
      return ui(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlazyrEntityActionResponse_Ui value) ui,
    required TResult Function(BlazyrEntityActionResponse_Text value) text,
    required TResult Function(BlazyrEntityActionResponse_None value) none,
  }) {
    return ui(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlazyrEntityActionResponse_Ui value)? ui,
    TResult? Function(BlazyrEntityActionResponse_Text value)? text,
    TResult? Function(BlazyrEntityActionResponse_None value)? none,
  }) {
    return ui?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlazyrEntityActionResponse_Ui value)? ui,
    TResult Function(BlazyrEntityActionResponse_Text value)? text,
    TResult Function(BlazyrEntityActionResponse_None value)? none,
    required TResult orElse(),
  }) {
    if (ui != null) {
      return ui(this);
    }
    return orElse();
  }
}

abstract class BlazyrEntityActionResponse_Ui
    implements BlazyrEntityActionResponse {
  const factory BlazyrEntityActionResponse_Ui(final BlazyrComponent field0) =
      _$BlazyrEntityActionResponse_UiImpl;

  BlazyrComponent get field0;
  @JsonKey(ignore: true)
  _$$BlazyrEntityActionResponse_UiImplCopyWith<
          _$BlazyrEntityActionResponse_UiImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BlazyrEntityActionResponse_TextImplCopyWith<$Res> {
  factory _$$BlazyrEntityActionResponse_TextImplCopyWith(
          _$BlazyrEntityActionResponse_TextImpl value,
          $Res Function(_$BlazyrEntityActionResponse_TextImpl) then) =
      __$$BlazyrEntityActionResponse_TextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class __$$BlazyrEntityActionResponse_TextImplCopyWithImpl<$Res>
    extends _$BlazyrEntityActionResponseCopyWithImpl<$Res,
        _$BlazyrEntityActionResponse_TextImpl>
    implements _$$BlazyrEntityActionResponse_TextImplCopyWith<$Res> {
  __$$BlazyrEntityActionResponse_TextImplCopyWithImpl(
      _$BlazyrEntityActionResponse_TextImpl _value,
      $Res Function(_$BlazyrEntityActionResponse_TextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$BlazyrEntityActionResponse_TextImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BlazyrEntityActionResponse_TextImpl
    implements BlazyrEntityActionResponse_Text {
  const _$BlazyrEntityActionResponse_TextImpl(this.field0);

  @override
  final String field0;

  @override
  String toString() {
    return 'BlazyrEntityActionResponse.text(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlazyrEntityActionResponse_TextImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlazyrEntityActionResponse_TextImplCopyWith<
          _$BlazyrEntityActionResponse_TextImpl>
      get copyWith => __$$BlazyrEntityActionResponse_TextImplCopyWithImpl<
          _$BlazyrEntityActionResponse_TextImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BlazyrComponent field0) ui,
    required TResult Function(String field0) text,
    required TResult Function() none,
  }) {
    return text(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent field0)? ui,
    TResult? Function(String field0)? text,
    TResult? Function()? none,
  }) {
    return text?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BlazyrComponent field0)? ui,
    TResult Function(String field0)? text,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlazyrEntityActionResponse_Ui value) ui,
    required TResult Function(BlazyrEntityActionResponse_Text value) text,
    required TResult Function(BlazyrEntityActionResponse_None value) none,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlazyrEntityActionResponse_Ui value)? ui,
    TResult? Function(BlazyrEntityActionResponse_Text value)? text,
    TResult? Function(BlazyrEntityActionResponse_None value)? none,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlazyrEntityActionResponse_Ui value)? ui,
    TResult Function(BlazyrEntityActionResponse_Text value)? text,
    TResult Function(BlazyrEntityActionResponse_None value)? none,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class BlazyrEntityActionResponse_Text
    implements BlazyrEntityActionResponse {
  const factory BlazyrEntityActionResponse_Text(final String field0) =
      _$BlazyrEntityActionResponse_TextImpl;

  String get field0;
  @JsonKey(ignore: true)
  _$$BlazyrEntityActionResponse_TextImplCopyWith<
          _$BlazyrEntityActionResponse_TextImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BlazyrEntityActionResponse_NoneImplCopyWith<$Res> {
  factory _$$BlazyrEntityActionResponse_NoneImplCopyWith(
          _$BlazyrEntityActionResponse_NoneImpl value,
          $Res Function(_$BlazyrEntityActionResponse_NoneImpl) then) =
      __$$BlazyrEntityActionResponse_NoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BlazyrEntityActionResponse_NoneImplCopyWithImpl<$Res>
    extends _$BlazyrEntityActionResponseCopyWithImpl<$Res,
        _$BlazyrEntityActionResponse_NoneImpl>
    implements _$$BlazyrEntityActionResponse_NoneImplCopyWith<$Res> {
  __$$BlazyrEntityActionResponse_NoneImplCopyWithImpl(
      _$BlazyrEntityActionResponse_NoneImpl _value,
      $Res Function(_$BlazyrEntityActionResponse_NoneImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BlazyrEntityActionResponse_NoneImpl
    implements BlazyrEntityActionResponse_None {
  const _$BlazyrEntityActionResponse_NoneImpl();

  @override
  String toString() {
    return 'BlazyrEntityActionResponse.none()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlazyrEntityActionResponse_NoneImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BlazyrComponent field0) ui,
    required TResult Function(String field0) text,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BlazyrComponent field0)? ui,
    TResult? Function(String field0)? text,
    TResult? Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BlazyrComponent field0)? ui,
    TResult Function(String field0)? text,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BlazyrEntityActionResponse_Ui value) ui,
    required TResult Function(BlazyrEntityActionResponse_Text value) text,
    required TResult Function(BlazyrEntityActionResponse_None value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BlazyrEntityActionResponse_Ui value)? ui,
    TResult? Function(BlazyrEntityActionResponse_Text value)? text,
    TResult? Function(BlazyrEntityActionResponse_None value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BlazyrEntityActionResponse_Ui value)? ui,
    TResult Function(BlazyrEntityActionResponse_Text value)? text,
    TResult Function(BlazyrEntityActionResponse_None value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class BlazyrEntityActionResponse_None
    implements BlazyrEntityActionResponse {
  const factory BlazyrEntityActionResponse_None() =
      _$BlazyrEntityActionResponse_NoneImpl;
}

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
