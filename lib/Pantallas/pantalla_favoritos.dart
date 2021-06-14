import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_application_proyecto_final/clases/favoritos.dart';
import 'package:flutter_application_proyecto_final/widgets/pelicula_favoritos_widget.dart';

class PantallaFavoritos extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<Favoritos>(
        builder: (context, estado, child) => Scaffold(
          appBar: AppBar(
            title: Text('Favoritos'),
            centerTitle: true,
          ),
          body: estado.getPeliculas().length == 0
              ? Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Aún no agregaste favoritos.',
                          style: TextStyle(
                              fontSize: 21.0, fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        '¡Empieza a descubrir tus peliculas',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        'preferidas!',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) => PeliculaFavoritosWidget(
                    pelicula: estado.getPeliculas()[index],
                  ),
                  itemCount: estado.getPeliculas().length,
                ),
        ),
      );
}
