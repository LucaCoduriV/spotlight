// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.17.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables

import 'api/simple.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_web.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_StateAppPtr => wire
      .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp;

  @protected
  StateApp
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          dynamic raw);

  @protected
  StateApp
      dco_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          dynamic raw);

  @protected
  StateApp
      dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          dynamic raw);

  @protected
  FutureOr<void> Function() dco_decode_DartFn_Inputs__Output_unit(dynamic raw);

  @protected
  Object dco_decode_DartOpaque(dynamic raw);

  @protected
  StateApp
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          dynamic raw);

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  Image dco_decode_box_autoadd_image(dynamic raw);

  @protected
  Entity dco_decode_entity(dynamic raw);

  @protected
  EntityError dco_decode_entity_error(dynamic raw);

  @protected
  Image dco_decode_image(dynamic raw);

  @protected
  List<Entity> dco_decode_list_entity(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  String? dco_decode_opt_String(dynamic raw);

  @protected
  Image? dco_decode_opt_box_autoadd_image(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  int dco_decode_usize(dynamic raw);

  @protected
  StateApp
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          SseDeserializer deserializer);

  @protected
  StateApp
      sse_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          SseDeserializer deserializer);

  @protected
  StateApp
      sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          SseDeserializer deserializer);

  @protected
  Object sse_decode_DartOpaque(SseDeserializer deserializer);

  @protected
  StateApp
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          SseDeserializer deserializer);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  Image sse_decode_box_autoadd_image(SseDeserializer deserializer);

  @protected
  Entity sse_decode_entity(SseDeserializer deserializer);

  @protected
  EntityError sse_decode_entity_error(SseDeserializer deserializer);

  @protected
  Image sse_decode_image(SseDeserializer deserializer);

  @protected
  List<Entity> sse_decode_list_entity(SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  String? sse_decode_opt_String(SseDeserializer deserializer);

  @protected
  Image? sse_decode_opt_box_autoadd_image(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  int sse_decode_usize(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  String cst_encode_String(String raw) {
    return raw;
  }

  @protected
  List<dynamic> cst_encode_box_autoadd_image(Image raw) {
    return cst_encode_image(raw);
  }

  @protected
  List<dynamic> cst_encode_entity(Entity raw) {
    return [
      cst_encode_usize(raw.index),
      cst_encode_String(raw.name),
      cst_encode_opt_String(raw.alias),
      cst_encode_opt_String(raw.description),
      cst_encode_opt_box_autoadd_image(raw.icon),
      cst_encode_String(raw.type)
    ];
  }

  @protected
  List<dynamic> cst_encode_entity_error(EntityError raw) {
    if (raw is EntityError_Unknown) {
      return [0, cst_encode_String(raw.field0)];
    }

    throw Exception('unreachable');
  }

  @protected
  List<dynamic> cst_encode_image(Image raw) {
    if (raw is Image_Data) {
      return [0, cst_encode_list_prim_u_8_strict(raw.field0)];
    }
    if (raw is Image_Path) {
      return [1, cst_encode_String(raw.field0)];
    }

    throw Exception('unreachable');
  }

  @protected
  List<dynamic> cst_encode_list_entity(List<Entity> raw) {
    return raw.map(cst_encode_entity).toList();
  }

  @protected
  Uint8List cst_encode_list_prim_u_8_strict(Uint8List raw) {
    return raw;
  }

  @protected
  String? cst_encode_opt_String(String? raw) {
    return raw == null ? null : cst_encode_String(raw);
  }

  @protected
  List<dynamic>? cst_encode_opt_box_autoadd_image(Image? raw) {
    return raw == null ? null : cst_encode_box_autoadd_image(raw);
  }

  @protected
  PlatformPointer
      cst_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          StateApp raw);

  @protected
  PlatformPointer
      cst_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          StateApp raw);

  @protected
  PlatformPointer
      cst_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          StateApp raw);

  @protected
  PlatformPointer cst_encode_DartFn_Inputs__Output_unit(
      FutureOr<void> Function() raw);

  @protected
  PlatformPointer cst_encode_DartOpaque(Object raw);

  @protected
  PlatformPointer
      cst_encode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          StateApp raw);

  @protected
  int cst_encode_u_8(int raw);

  @protected
  void cst_encode_unit(void raw);

  @protected
  int cst_encode_usize(int raw);

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          StateApp self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          StateApp self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          StateApp self, SseSerializer serializer);

  @protected
  void sse_encode_DartFn_Inputs__Output_unit(
      FutureOr<void> Function() self, SseSerializer serializer);

  @protected
  void sse_encode_DartOpaque(Object self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          StateApp self, SseSerializer serializer);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_image(Image self, SseSerializer serializer);

  @protected
  void sse_encode_entity(Entity self, SseSerializer serializer);

  @protected
  void sse_encode_entity_error(EntityError self, SseSerializer serializer);

  @protected
  void sse_encode_image(Image self, SseSerializer serializer);

  @protected
  void sse_encode_list_entity(List<Entity> self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_opt_String(String? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_image(Image? self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_usize(int self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);
}

// Section: wire_class

class RustLibWire extends BaseWire {
  RustLibWire.fromExternalLibrary(ExternalLibrary lib);

  void dart_fn_deliver_output(int call_id, PlatformGeneralizedUint8ListPtr ptr_,
          int rust_vec_len_, int data_len_) =>
      wasmModule.dart_fn_deliver_output(
          call_id, ptr_, rust_vec_len_, data_len_);

  void wire_StateApp_execute(NativePortType port_, Object that, int id,
          String? arg, PlatformPointer on_executed) =>
      wasmModule.wire_StateApp_execute(port_, that, id, arg, on_executed);

  void wire_StateApp_get_commands(NativePortType port_, Object that) =>
      wasmModule.wire_StateApp_get_commands(port_, that);

  void wire_StateApp_new(NativePortType port_) =>
      wasmModule.wire_StateApp_new(port_);

  void wire_init_app(NativePortType port_) => wasmModule.wire_init_app(port_);

  void wire_search(NativePortType port_, Object obj, String search) =>
      wasmModule.wire_search(port_, obj, search);

  void rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          dynamic ptr) =>
      wasmModule
          .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
              ptr);

  void rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          dynamic ptr) =>
      wasmModule
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
              ptr);
}

@JS('wasm_bindgen')
external RustLibWasmModule get wasmModule;

@JS()
@anonymous
class RustLibWasmModule implements WasmModule {
  @override
  external Object /* Promise */ call([String? moduleName]);

  @override
  external RustLibWasmModule bind(dynamic thisArg, String moduleName);

  external void dart_fn_deliver_output(int call_id,
      PlatformGeneralizedUint8ListPtr ptr_, int rust_vec_len_, int data_len_);

  external void wire_StateApp_execute(NativePortType port_, Object that, int id,
      String? arg, PlatformPointer on_executed);

  external void wire_StateApp_get_commands(NativePortType port_, Object that);

  external void wire_StateApp_new(NativePortType port_);

  external void wire_init_app(NativePortType port_);

  external void wire_search(NativePortType port_, Object obj, String search);

  external void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          dynamic ptr);

  external void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockStateApp(
          dynamic ptr);
}
