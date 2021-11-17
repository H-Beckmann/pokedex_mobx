import 'package:mobx/mobx.dart';
import 'package:pokedex_mobx/models/pokemon.dart';
import 'package:pokedex_mobx/repositories/pokemon_repository.dart';
part 'search_store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  @observable
  Future<List<Pokemon>> pokeList = fetchAll(30);
  // @observable
  // String pokeNome = "";
  // @action
  // void setPokeNome(String value) => pokeNome = value;
  @action
  Future<List<Pokemon>> pokeGet(String pokeNome) async => pokeNome.isNotEmpty? fetchByName(pokeNome) : fetchAll(30);
}