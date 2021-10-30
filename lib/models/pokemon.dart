import 'package:pokedex_mobx/models/type.dart';

class Pokemon {
  final int id;
  final String name;
  final List<Type> types;
  final String versionGroup;
  final String image;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.versionGroup,
    required this.image,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['pokemon']['name'],
      types: json['types'].cast<Type>(),
      versionGroup: json['version_group']['name'],
      image: json['sprites']['front_default']
    );
  }
}
