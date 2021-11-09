import 'package:flutter/material.dart';
import 'package:pokedex_mobx/UI/pokemon_listining.dart';
import 'UI/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const PokemonList(title: 'Pokedex'),
    );
  }
}