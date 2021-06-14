import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_proyecto_final/clases/favoritos.dart';
import 'package:flutter_application_proyecto_final/clases/pelicula.dart';

class BotonFavoritos extends StatelessWidget {
  final Pelicula pelicula;
  final Color color;

  const BotonFavoritos({Key key, this.pelicula, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pelicula>>(
      future: Provider.of<Favoritos>(context, listen: false).cargarFavoritos(),
      builder: (context, snapshot) => snapshot.data != null
          ? IconButton(
              splashRadius: 5,
              iconSize: 22,
              color: color,
              icon: Provider.of<Favoritos>(context, listen: false).getPeliculas().any(
                      (element) => element.descripcion == pelicula.descripcion)
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              onPressed: () => Provider.of<Favoritos>(context, listen: false)
                      .getPeliculas()
                      .any((element) =>
                          element.descripcion == pelicula.descripcion)
                  ? Provider.of<Favoritos>(context, listen: false)
                      .eliminarDeFavoritos(pelicula)
                  : Provider.of<Favoritos>(context, listen: false)
                      .agregarAFavoritos(pelicula))
          : Container(),
    );
  }
}
