import 'package:flutter_application_proyecto_final/clases/pelicula.dart';
import 'package:dio/dio.dart';

Future<List<Pelicula>> obtenerPeliculas(orden, query) async {
  try {
    final url =
        "https://api.themoviedb.org/3/$orden?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es&page=1$query";
    Response respuesta = await Dio().get(url);

    final json = respuesta.data['results'];

    var listadoPeliculas =
        List<Pelicula>.from(json.map((x) => Pelicula.fromJson(x)));
    return listadoPeliculas;
  } catch (e) {
    print(e);
    return [];
  }
}
