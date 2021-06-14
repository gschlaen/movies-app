import 'package:flutter/material.dart';
import 'package:flutter_application_proyecto_final/clases/pelicula.dart';
import 'package:flutter_application_proyecto_final/servicios/obtener_peliculas_servicio.dart';
import 'package:flutter_application_proyecto_final/widgets/pelicula_widget.dart';

class QueryPelicula extends StatelessWidget {
  const QueryPelicula({Key key, this.query}) : super(key: key);

  final String orden = 'search/movie';
  final String query;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pelicula>>(
        future: obtenerPeliculas(orden, query),
        builder: (context, snapshot) => snapshot.data == null
            ? Center(child: CircularProgressIndicator())
            : snapshot.data.length == 0
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Nada por acá...',
                          style: TextStyle(
                              fontSize: 21.0, fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text('No encontramos películas para esta búsqueda',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w300)),
                    ],
                  ))
                : ListView.builder(
                    itemBuilder: (context, index) => PeliculaWidget(
                      pelicula: snapshot.data[index],
                    ),
                    itemCount: snapshot.data.length,
                  ));
  }
}
