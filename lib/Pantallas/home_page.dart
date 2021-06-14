import 'package:flutter/material.dart';

import '../clases/pelicula.dart';
import 'package:flutter_application_proyecto_final/widgets/listado_peliculas.dart';
import 'package:flutter_application_proyecto_final/Pantallas/pantalla_favoritos.dart';
import '../clases/pelicula_search_delegate.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.pelicula}) : super(key: key);

  final Pelicula pelicula;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking de películas'),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(text: 'Mas populares'),
            Tab(text: 'Mejor valoradas'),
          ],
        ),
        elevation: 5,
      ),
      body: TabBarView(
        children: [
          ListadoPeliculas(orden: 'movie/popular'),
          ListadoPeliculas(orden: 'movie/top_rated')
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.orange,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          unselectedFontSize: 14.0,
          items: [
            BottomNavigationBarItem(
              label: 'Favoritos',
              icon: IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PantallaFavoritos()))),
            ),
            BottomNavigationBarItem(
              label: 'Buscar',
              icon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => showSearch(
                      context: context,
                      delegate: PeliculaSearchDelegate(' Buscar...'))),
            )
          ]),
      //floatingActionButton: FloatingActionButton(
      //child: Icon(Icons.search),
      //onPressed: null,
      //),
    );
  }
}
