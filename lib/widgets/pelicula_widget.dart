import 'package:flutter/material.dart';
import 'package:flutter_application_proyecto_final/clases/favoritos.dart';
import 'package:flutter_application_proyecto_final/clases/pelicula.dart';
import 'package:flutter_application_proyecto_final/Pantallas/pantalla_detalle_pelicula.dart';
import 'package:flutter_application_proyecto_final/widgets/boton_favoritos.dart';
import 'package:provider/provider.dart';

class PeliculaWidget extends StatelessWidget {
  PeliculaWidget({
    this.pelicula,
  });

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PantallaDetallePelicula(pelicula: pelicula),
          ),
        ),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  pelicula.urlPortada,
                  //scale: 2.2,
                  width: MediaQuery.of(context).size.width / 4.2,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * (1 - 1 / 4.5) - 73,
                  height: 140,
                  padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pelicula.titulo,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(pelicula.fechaEstreno,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: 12,
                        ),
                        Text(pelicula.idGeneros,
                            maxLines: 2,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400)),
                      ]),
                ),
                Consumer<Favoritos>(
                    builder: (context, value, child) => BotonFavoritos(
                        pelicula: pelicula, color: Colors.orange)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
