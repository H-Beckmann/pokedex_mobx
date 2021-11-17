import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokedex_mobx/models/pokemon.dart';
import 'package:pokedex_mobx/models/type_color.dart';
import 'package:pokedex_mobx/repositories/pokemon_repository.dart';
import "../utils/string_extension.dart";
import "../utils/text_style.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.pokemon}) : super(key: key);
  final String title;
  final Pokemon pokemon;

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
      backgroundColor: fromHex(getColor(widget.pokemon.types[0].name)),
      body: Center(
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
                            Navigator.pop(context);
                          },
                          iconSize: 32,
                          icon: const Icon(Icons.arrow_back_outlined),
                          color: Colors.white,
                        ),
                        Text(
                          widget.pokemon.name.capitalize(),
                          style: myTextStyleBase.title,
                        ),
                        if (widget.pokemon.id < 10) ...[
                          Text(
                            '#00${widget.pokemon.id}',
                            style: myTextStyleBase.subtitle,
                          ),
                        ] else if (widget.pokemon.id < 100) ...[
                          Text(
                            '#0${widget.pokemon.id}',
                            style: myTextStyleBase.subtitle,
                          ),
                        ] else ...[
                          Text(
                            '#${widget.pokemon.id}',
                            style: myTextStyleBase.subtitle,
                          ),
                        ]
                      ],
                    ),
                  ),
                  Image.network(
                    widget.pokemon.image,
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
                                  widget.pokemon.types.length,
                                  (index) => Card(
                                    color: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: fromHex(
                                          getColor(
                                              widget.pokemon.types[index].name),
                                        ),
                                      ),
                                      height: 24,
                                      width: 55.2,
                                      child: Center(
                                        child: Text(
                                          widget.pokemon.types[index].name
                                              .capitalize(),
                                          style: myTextStyleBase.type_name,
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
                                  style: myTextStyleBase.card_title,
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
                                            color: Color(0xFF212121), //ISSO
                                            size: 16,
                                          ),
                                          Text(
                                            ' ${widget.pokemon.weight / 10} kg',
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
                                    child: VerticalDivider( //ISSO
                                        color: Color(0xFFE0E0E0)),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.height,
                                            color: Color(0xFF212121), //ISSO
                                            size: 16,
                                          ),
                                          Text(
                                            ' ${widget.pokemon.height / 10} m',
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
                                  style: myTextStyleBase.card_title,
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
                                    child: VerticalDivider( //ISSO
                                        color: Color(0xFFE0E0E0)),
                                  ),
                                  Column(
                                    children: [
                                      Text('${widget.pokemon.hp}',
                                          style: myTextStyleBase.stats_text),
                                      Text('${widget.pokemon.attack}',
                                          style: myTextStyleBase.stats_text),
                                      Text('${widget.pokemon.defense}',
                                          style: myTextStyleBase.stats_text),
                                      Text('${widget.pokemon.spattack}',
                                          style: myTextStyleBase.stats_text),
                                      Text('${widget.pokemon.spdefense}',
                                          style: myTextStyleBase.stats_text),
                                      Text('${widget.pokemon.speed}',
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
            )
    );
  }
}
