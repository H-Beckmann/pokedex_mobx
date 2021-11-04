import 'package:pokedex_mobx/models/type.dart';

class Pokemon {
  final int id;
  final String name;
  final List<Type> types;
  //final String versionGroup;
  final String image;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    //required this.versionGroup,
    required this.image,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['species']['name'],
      types: json['types'].map((data) => Type.fromJson(data)).toList().cast<Type>(),
      //versionGroup: json['game_indicies']['version']['name'],
      image: json['sprites']['front_default']
    );
  }
}
