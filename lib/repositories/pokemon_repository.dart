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

Future<List<Pokemon>> fetchAll() async{
  final http.Response response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit20'));
  if (response.statusCode == 200) {
    var r = json.decode(response.body);
    List<Pokemon> list = List<Pokemon>.from(r['results'].map((Pokemon)=> Pokemon.fromJson(Pokemon)));
    return list;
  } else {
    throw Exception('Failed to load a Pokemon');
  }
}
