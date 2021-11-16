import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokedex_mobx/models/pokemon.dart';
import 'package:pokedex_mobx/models/type_color.dart';
import 'package:pokedex_mobx/repositories/pokemon_repository.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        leading: const Icon(Icons.catching_pokemon),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: FutureBuilder<Pokemon>(
          future: futurePokemon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.name),
                  Image.network(snapshot.data!.image),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        snapshot.data!.types.length,
                        (index) => Card(
                          color: Colors.transparent,
                          shadowColor: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: fromHex(
                                    getColor(snapshot.data!.types[index].name)),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            height: 40,
                            width: 100,
                            child: Center(
                              child: Text(
                                snapshot.data!.types[index].name.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text("HP: ${snapshot.data!.hp}"),
                  Text("Peso: ${snapshot.data!.weight}")
                ],
              );
            } else if (snapshot.hasError) {
              return Text('{$snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
