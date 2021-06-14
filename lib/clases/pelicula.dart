import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Pelicula {
  Pelicula({
    this.titulo,
    this.idGeneros,
    this.descripcion,
    this.fechaEstreno,
    this.anio,
    this.urlPortada,
    this.urlFondo,
    this.score,
  });

  factory Pelicula.fromJson(Map<String, dynamic> json) {
    final titulo = json['title'];
    final idGeneros =
        idGenerosToGeneros(List<int>.from(json['genre_ids']), codigoGeneros);
    final descripcion = json['overview'];
    initializeDateFormatting('es');
    final fechaEstreno = json.containsKey('release_date') == false ||
            json['release_date'] == ''
        ? ''
        : DateFormat.yMMMd('es').format(DateTime.parse(json['release_date']));
    final anio =
        json.containsKey('release_date') == false || json['release_date'] == ''
            ? ''
            : DateFormat.y().format(DateTime.parse(json['release_date']));
    final urlPortada = json['poster_path'] == null
        ? 'https://cdn.pixabay.com/photo/2017/01/25/17/35/picture-2008484_960_720.png'
        : 'https://image.tmdb.org/t/p/w600_and_h900_bestv2' +
            json['poster_path'];
    final urlFondo = json['backdrop_path'] == null
        ? ''
        : 'https://image.tmdb.org/t/p/original' + json['backdrop_path'];
    final score = json['vote_average'] + 0.0;

    return Pelicula(
      titulo: titulo,
      idGeneros: idGeneros,
      descripcion: descripcion,
      fechaEstreno: fechaEstreno,
      anio: anio,
      urlPortada: urlPortada,
      urlFondo: urlFondo,
      score: score,
    );
  }

  final String titulo;
  final String idGeneros;
  final String descripcion;
  final String fechaEstreno;
  final String anio;
  final String urlPortada;
  final String urlFondo;
  final double score;
}

const List<Map<String, dynamic>> codigoGeneros = [
  {"id": 28, "name": "Acción"},
  {"id": 12, "name": "Aventura"},
  {"id": 16, "name": "Animación"},
  {"id": 35, "name": "Comedia"},
  {"id": 80, "name": "Crimen"},
  {"id": 99, "name": "Documental"},
  {"id": 18, "name": "Drama"},
  {"id": 10751, "name": "Familia"},
  {"id": 14, "name": "Fantasía"},
  {"id": 36, "name": "Historia"},
  {"id": 27, "name": "Terror"},
  {"id": 10402, "name": "Música"},
  {"id": 9648, "name": "Misterio"},
  {"id": 10749, "name": "Romance"},
  {"id": 878, "name": "Ciencia ficción"},
  {"id": 10770, "name": "Película de TV"},
  {"id": 53, "name": "Suspenso"},
  {"id": 10752, "name": "Bélica"},
  {"id": 37, "name": "Western"}
];

idGenerosToGeneros(
    List<int> idGeneros, List<Map<String, dynamic>> listaIdGeneros) {
  String generos = '';
  for (var i = 0; i < idGeneros.length; i++) {
    var match =
        listaIdGeneros.firstWhere((element) => element['id'] == idGeneros[i]);
    if (i == 0) {
      generos = match['name'];
    } else {
      generos = generos + ' / ' + match['name'];
    }
  }
  return generos;
}
