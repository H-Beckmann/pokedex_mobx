class Type {
  final int id;
  final String name;

  Type({
    required this.id,
    required this.name,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      id: json['slot'],
      name: json['type']['name'],
    );
  }
}
