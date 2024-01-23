// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.17.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
part 'simple.freezed.dart';

String greet({required String name, dynamic hint}) =>
    RustLib.instance.api.greet(name: name, hint: hint);

Future<List<Entity>> search(
        {required StateApp obj, required String search, dynamic hint}) =>
    RustLib.instance.api.search(obj: obj, search: search, hint: hint);

// Rust type: flutter_rust_bridge::RustOpaque<flutter_rust_bridge::for_generated::rust_async::RwLock<StateApp>>
@sealed
class StateApp extends RustOpaque {
  StateApp.dcoDecode(List<dynamic> wire) : super.dcoDecode(wire, _kStaticData);

  StateApp.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_StateApp,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_StateApp,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_StateAppPtr,
  );

  Future<void> execute({required int id, String? arg, dynamic hint}) =>
      RustLib.instance.api.stateAppExecute(
        that: this,
        id: id,
        arg: arg,
      );

  static Future<StateApp> newStateApp({dynamic hint}) =>
      RustLib.instance.api.stateAppNew(hint: hint);
}

class Entity {
  final int index;
  final String name;
  final String? alias;
  final String? description;
  final String? iconPath;

  const Entity({
    required this.index,
    required this.name,
    this.alias,
    this.description,
    this.iconPath,
  });

  @override
  int get hashCode =>
      index.hashCode ^
      name.hashCode ^
      alias.hashCode ^
      description.hashCode ^
      iconPath.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Entity &&
          runtimeType == other.runtimeType &&
          index == other.index &&
          name == other.name &&
          alias == other.alias &&
          description == other.description &&
          iconPath == other.iconPath;
}

@freezed
sealed class EntityError with _$EntityError implements FrbException {
  const factory EntityError.unknown(
    String field0,
  ) = EntityError_Unknown;
}
