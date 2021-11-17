import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokedex_mobx/models/pokemon.dart';
import 'package:pokedex_mobx/models/type_color.dart';
import 'package:pokedex_mobx/repositories/pokemon_repository.dart';
import "../utils/string_extension.dart";
import "../utils/text_style.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Pokemon> futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon(6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEE8130),
      body: FutureBuilder<Pokemon>(
        future: futurePokemon,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            print('Voltar a Tela Inicial');
                          },
                          iconSize: 32,
                          icon: const Icon(Icons.arrow_back_outlined),
                          color: Colors.white,
                        ),
                        Text(
                          snapshot.data!.name.capitalize(),
                          style: myTextStyleBase.title,
                        ),
                        Text(
                          '#00${snapshot.data!.id}',
                          style: myTextStyleBase.subtitle,
                        ),
                      ],
                    ),
                  ),
                  Image.network(
                    snapshot.data!.image,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  snapshot.data!.types.length,
                                  (index) => Card(
                                    color: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: fromHex(
                                          getColor(
                                              snapshot.data!.types[index].name),
                                        ),
                                      ),
                                      height: 24,
                                      width: 55.2,
                                      child: Center(
                                        child: Text(
                                          snapshot.data!.types[index].name
                                              .capitalize(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  "Sobre",
                                  style: TextStyle(
                                    color: Color(0xFFEE8130),
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons
                                                .swap_horizontal_circle_outlined,
                                            color: Color(0xFF212121),
                                            size: 16,
                                          ),
                                          Text(
                                            ' ${snapshot.data!.weight / 10} kg',
                                            style: myTextStyleBase.atribute,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Peso',
                                        style: myTextStyleBase.atribute_title,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32.0),
                                    height: 40,
                                    child: VerticalDivider(
                                        color: Color(0xFFE0E0E0)),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.height,
                                            color: Color(0xFF212121),
                                            size: 16,
                                          ),
                                          Text(
                                            ' ${snapshot.data!.height / 10} m',
                                            style: myTextStyleBase.atribute,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Altura',
                                        style: myTextStyleBase.atribute_title,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  "Atributos Base",
                                  style: TextStyle(
                                    color: Color(0xFFEE8130),
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text('HP', style: myTextStyleBase.stats),
                                      Text('ATK', style: myTextStyleBase.stats),
                                      Text('DEF', style: myTextStyleBase.stats),
                                      Text('SATK',
                                          style: myTextStyleBase.stats),
                                      Text('SDEF',
                                          style: myTextStyleBase.stats),
                                      Text('SPD', style: myTextStyleBase.stats),
                                    ],
                                  ),
                                  Container(
                                    height: 120,
                                    child: VerticalDivider(
                                        color: Color(0xFFE0E0E0)),
                                  ),
                                  Column(
                                    children: [
                                      Text('${snapshot.data!.hp}',
                                          style: myTextStyleBase.stats_text),
                                      Text('${snapshot.data!.attack}',
                                          style: myTextStyleBase.stats_text),
                                      Text('${snapshot.data!.defense}',
                                          style: myTextStyleBase.stats_text),
                                      Text('${snapshot.data!.spattack}',
                                          style: myTextStyleBase.stats_text),
                                      Text('${snapshot.data!.spdefense}',
                                          style: myTextStyleBase.stats_text),
                                      Text('${snapshot.data!.speed}',
                                          style: myTextStyleBase.stats_text),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('{$snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
