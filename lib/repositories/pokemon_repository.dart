import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_mobx/models/pokemon.dart';

Future<Pokemon> fetchPokemon(int id) async {
  final http.Response response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon-form/$id/'));
  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load a Pokemon');
  }
}

Future<List<Pokemon>> fetchAll(int limit) async{
  List<Pokemon> list= List.empty(growable: true);
  for (var id = 1; id <= limit; id++) {
    final http.Response response = 
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon-form/$id/'));
    if(response.statusCode==200) {
      list.add(Pokemon.fromJson(jsonDecode(response.body)));
    } else{
      throw Exception("Failed to catch the pokemon");
    }
  }
  return list;
}
