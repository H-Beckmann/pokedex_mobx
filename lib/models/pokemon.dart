import 'package:pokedex_mobx/models/type.dart';

class Pokemon {
  final int id;
  final String name;
  final Type types;
  final String versionGroup;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.versionGroup,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['pokemon.name'],
      types: json['types'],
      versionGroup: json['version_group.name'],
    );
  }
}
