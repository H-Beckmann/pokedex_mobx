import 'package:flutter/material.dart';
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.name),
                  Image.network(snapshot.data!.image),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: snapshot.data!.types.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Text(snapshot.data!.types[index].name),
                          tileColor: fromHex(getColor(snapshot.data!.types[index].name))
                        );
                      }
                    ),
                  )
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