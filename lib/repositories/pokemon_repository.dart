import 'package:pokedex_mobx/models/pokemon.dart';
import 'package:dio/dio.dart';
import 'package:pokedex_mobx/stores/searchStore/search_store.dart';
import 'package:pokedex_mobx/utils/pokemon_name_list.dart';


Future<List<String>> fetchNames() async{
  var response = await Dio().get('https://pokeapi.co/api/v2/pokemon?limit=1118');
  List<String> lista = List<String>.from(response.data['results'].map((data)=>data['name']).toList());
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
  List<String> similarResults = getSimilarResults(name);
  List<Pokemon> list = List.empty(growable: true);
  for (var element in similarResults) {
    var response = await Dio().get('https://pokeapi.co/api/v2/pokemon/${element.toLowerCase()}/');
    if (response.statusCode == 200) {
      list.add(Pokemon.fromJson(response.data));
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
