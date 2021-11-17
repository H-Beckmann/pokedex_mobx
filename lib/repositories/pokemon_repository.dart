import 'package:pokedex_mobx/models/pokemon.dart';
import 'package:dio/dio.dart';
import 'package:pokedex_mobx/stores/searchStore/search_store.dart';
import 'package:pokedex_mobx/utils/pokemon_name_list.dart';

SearchStore searchStore = SearchStore();

Future<List<String>> fetchNames() async{
  List<String> lista = List.empty(growable: true);
  var response = await Dio().get('https://pokeapi.co/api/v2/pokemon?limit=1118');
  lista = response.data['results'].map((data)=>(response.data['results']['name'])).toList();
  return lista;
}

Future<Pokemon> fetchPokemon(int id) async {
  var response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$id/');
  if (response.statusCode == 200) {
    return Pokemon.fromJson(response.data);
  } else {
    throw Exception('Failed to load a Pokemon');
  }
}

Future<List<Pokemon>> fetchByName(String name) async {
  List<String> similarResults = searchStore.pokeNames as List<String>;
  List<Pokemon> list = List.empty(growable: true);
  for (var element in similarResults){
    var pokeName = element.toLowerCase();
    var response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$pokeName/');
    if (response.statusCode == 200) {
      list.add(Pokemon.fromJson(response.data));
    } else {
      throw Exception('Failed to catch the Pokemon by name');
    }
  }
  return list;
}

Future<List<Pokemon>> fetchAll(int limit) async{
  List<Pokemon> list = List.empty(growable: true);
  for (var id = 1; id <= limit; id++) {
    var response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$id/');
    if(response.statusCode==200) {
      list.add(Pokemon.fromJson(response.data));
    } else{
      throw Exception("Failed to catch the Pokemon");
    }
  }
  return list;
}
