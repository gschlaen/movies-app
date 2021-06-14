import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'pelicula.dart';

class Favoritos extends ChangeNotifier {
  List<Pelicula> _favoritos = [];

  List<Pelicula> getPeliculas() => _favoritos;
  //List<Pelicula> getPeliculas() => cargarFavoritos();

  void agregarAFavoritos(Pelicula pelicula) {
    if (_favoritos
        .any((element) => element.descripcion == pelicula.descripcion)) {
      _favoritos = _favoritos;
    } else {
      _favoritos.add(pelicula);
      notifyListeners();

      guardarFavoritos();
    }
  }

  void eliminarDeFavoritos(Pelicula pelicula) {
    _favoritos
        .removeWhere((element) => element.descripcion == pelicula.descripcion);
    notifyListeners();

    guardarFavoritos();
  }

  void guardarFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    var mapFavoritos = _favoritos.map((e) => peliculaToMap(e)).toList();
    String rawJson = jsonEncode(mapFavoritos);
    prefs.setString('favoritos', rawJson);
  }

  Map<String, dynamic> peliculaToMap(Pelicula pelicula) {
    Map<String, dynamic> map = {
      'title': pelicula.titulo,
      'genres': pelicula.idGeneros,
      'overview': pelicula.descripcion,
      'release_date': pelicula.fechaEstreno,
      'year': pelicula.anio,
      'urlPoster': pelicula.urlPortada,
      'urlBackdrop': pelicula.urlFondo,
      'vote_average': pelicula.score,
    };
    return map;
  }

  Future<List<Pelicula>> cargarFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    List<Pelicula> _favoritos = [];
    if (prefs.getString('favoritos') != null) {
      final rawJson = prefs.getString('favoritos');
      var mapFavoritos = json.decode(rawJson);
      _favoritos =
          List<Pelicula>.from(mapFavoritos.map((e) => mapToPeliculas(e)));
    }
    return _favoritos;
  }

  Pelicula mapToPeliculas(Map<String, dynamic> map) {
    final String titulo = map['title'];
    final String idGeneros = map['genres'];
    final String descripcion = map['overview'];
    final String fechaEstreno = map['release_date'];
    final String anio = map['year'];
    final String urlPortada = map['urlPoster'];
    final String urlFondo = map['urlBackdrop'];
    final double score = map['vote_average'];

    var pelicula = Pelicula(
        titulo: titulo,
        idGeneros: idGeneros,
        descripcion: descripcion,
        fechaEstreno: fechaEstreno,
        anio: anio,
        urlPortada: urlPortada,
        urlFondo: urlFondo,
        score: score);

    agregarAFavoritos(pelicula);
    return (pelicula);
  }
}
