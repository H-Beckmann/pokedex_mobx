import 'package:flutter/material.dart';
import 'package:pokedex_mobx/UI/pokemon_listining.dart';
import 'package:pokedex_mobx/stores/searchStore/search_store.dart';
import 'package:pokedex_mobx/repositories/pokemon_repository.dart';
import 'package:provider/provider.dart';
import 'UI/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider<SearchStore>(
      create: (_) => SearchStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const MyHomePage(
          title: 'Pokedex',
        ),
      ),
    );
  }
}
