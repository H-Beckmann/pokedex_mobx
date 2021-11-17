// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStoreBase, Store {
  final _$pokeListAtom = Atom(name: '_SearchStoreBase.pokeList');

  @override
  Future<List<Pokemon>> get pokeList {
    _$pokeListAtom.reportRead();
    return super.pokeList;
  }

  @override
  set pokeList(Future<List<Pokemon>> value) {
    _$pokeListAtom.reportWrite(value, super.pokeList, () {
      super.pokeList = value;
    });
  }

  final _$pokeGetAsyncAction = AsyncAction('_SearchStoreBase.pokeGet');

  @override
  Future<List<Pokemon>> pokeGet(String pokeNome) {
    return _$pokeGetAsyncAction.run(() => super.pokeGet(pokeNome));
  }

  @override
  String toString() {
    return '''
pokeList: ${pokeList}
    ''';
  }
}
