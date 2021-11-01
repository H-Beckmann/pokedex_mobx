import 'package:flutter/material.dart';
import 'package:pokedex_mobx/models/pokemon.dart';
import 'package:pokedex_mobx/repositories/pokemon_repository.dart';
import 'package:transparent_image/transparent_image.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({ Key? key, required this.title }) : super(key: key);
  final String title;

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<Pokemon>> pokeList;
  @override
  void initState() {
    super.initState();
    pokeList = fetchAll();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: const Icon(Icons.catching_pokemon)
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder<List<Pokemon>>(
        future: pokeList,
        builder: (context, snapshot) {
          return GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ), 
          itemCount: 20,
          itemBuilder: (context, index){
            if(index < 20) {
              return GestureDetector(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage, 
                  image: snapshot.data!.elementAt(index).image,
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
                onTap: (){ },
              );
            } else {
              return GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.add, color: Colors.white, size: 70.0,),
                    Text(
                      "Carregar mais...",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    )
                  ],
                ),
              );
            }
          }
    );
        }
      )
    );
  }
}