import 'package:flutter/material.dart';
import 'package:flutter_application_proyecto_final/clases/pelicula.dart';
import 'package:flutter_application_proyecto_final/servicios/obtener_peliculas_servicio.dart';
import 'package:flutter_application_proyecto_final/widgets/pelicula_widget.dart';

class ListadoPeliculas extends StatelessWidget {
  const ListadoPeliculas({Key key, this.orden}) : super(key: key);

  final String orden;
  final String query = '';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pelicula>>(
      future: obtenerPeliculas(orden, query),
      builder: (context, snapshot) => snapshot.data != null
          ? ListView.builder(
              itemBuilder: (context, index) => PeliculaWidget(
                pelicula: snapshot.data[index],
              ),
              itemCount: snapshot.data.length,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
