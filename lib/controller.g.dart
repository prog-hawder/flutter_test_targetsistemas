// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$anotacaoAtom =
      Atom(name: 'ControllerBase.anotacao', context: context);

  @override
  String get anotacao {
    _$anotacaoAtom.reportRead();
    return super.anotacao;
  }

  @override
  set anotacao(var value) {
    _$anotacaoAtom.reportWrite(value, super.anotacao, () {
      super.anotacao = value;
    });
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  dynamic changeAnotacao(String value) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.changeAnotacao');
    try {
      return super.changeAnotacao(value);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
anotacao: ${anotacao}
    ''';
  }
}
