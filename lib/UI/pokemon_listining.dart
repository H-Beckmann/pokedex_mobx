import 'package:flutter/material.dart';
import 'package:pokedex_mobx/models/pokemon.dart';
import 'package:pokedex_mobx/models/type_color.dart';
import 'package:pokedex_mobx/repositories/pokemon_repository.dart';
import 'package:transparent_image/transparent_image.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<Pokemon>> pokeList;
  @override
  void initState() {
    super.initState();
    pokeList = fetchAll(150);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
          leading: const Icon(Icons.catching_pokemon)
        ),
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                labelText: "Pesquise aqui",
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
              onSubmitted: (text){
              },
            ),
          ),
            Expanded(
              child: FutureBuilder<List<Pokemon>>(
                future: pokeList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        padding: const EdgeInsets.all(10.0),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: 150,
                        itemBuilder: (context, index) {
                          if (index < 150) {
                            return Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  gradient: snapshot.data![index].types.length>1 ? LinearGradient(
                                    begin: const Alignment(-1, -1),
                                    end: const Alignment(1, 1),
                                    colors: [fromHex(getColor(snapshot.data![index].types[0].name)), fromHex(getColor(snapshot.data![index].types[1].name))],
                                  ) : LinearGradient(
                                    begin: const Alignment(-1, -1),
                                    end: const Alignment(1, 1),
                                    colors: [fromHex(getColor(snapshot.data![index].types[0].name)), fromHex(getColor(snapshot.data![index].types[0].name))],
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: GestureDetector(
                                  child: Column(
                                    children: [
                                      FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: snapshot.data![index].image,
                                        height: 90.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(snapshot.data![index].name)
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            );
                          } else {
                            return GestureDetector(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 70.0,
                                  ),
                                  Text(
                                    "Carregar mais...",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22.0),
                                  )
                                ],
                              ),
                            );
                          }
                        });
                  } else if (snapshot.hasError) {
                    return Text('{$snapshot.error}');
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text("Catching all pokemons..."),
                        ),
                        Text("Spoiler: It will take a while")
                      ],
                    )
                  );
                },
              ),
            ),
          ],
        ));
  }
}
