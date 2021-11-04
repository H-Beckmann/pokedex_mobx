import 'package:pokedex_mobx/models/type.dart';

class Pokemon {
  final int id;
  final String name;
  final List<Type> types;
  //final String versionGroup;
  final String image;
  final int hp;
  final int attack;
  final int defense;
  final int spattack;
  final int spdefense;
  final int speed;
  final int weight;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    //required this.versionGroup,
    required this.image,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spattack,
    required this.spdefense,
    required this.speed,
    required this.weight
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['species']['name'],
      types: json['types'].map((data) => Type.fromJson(data)).toList().cast<Type>(),
      //versionGroup: json['game_indicies']['version']['name'],
      image: json['sprites']['front_default'],
      hp: json['stats'][0]['base_stat'],
      attack: json['stats'][1]['base_stat'],
      defense: json['stats'][2]['base_stat'],
      spattack: json['stats'][3]['base_stat'],
      spdefense: json['stats'][4]['base_stat'],
      speed: json['stats'][0]['base_stat'],
      weight: json['weight']
    );
  }
}
