import 'package:pokedex_mobx/models/pokemon.dart';
import 'package:dio/dio.dart';
import 'package:pokedex_mobx/utils/pokemon_name_list.dart';

Future<Pokemon> fetchPokemon(int id) async {
  var response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$id/');
  if (response.statusCode == 200) {
    return Pokemon.fromJson(response.data);
  } else {
    throw Exception('Failed to load a Pokemon');
  }
}

//TODO: criar metodo de pesquisa por nome
Future<List<Pokemon>> fetchByName(String name) async {
  List<String> similarResults = getSimilarResults(name);
  List<Pokemon> list = List.empty(growable: true);

  similarResults.forEach((element) async {
    var pokeName = element.toLowerCase();
    var response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$pokeName/');

    if (response.statusCode == 200) {
      list.add(Pokemon.fromJson(response.data));
    } else {
      throw Exception('Failed to catch the Pokemon by name');
    }
  });

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
