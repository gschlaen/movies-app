import 'package:flutter/material.dart';
import 'package:flutter_application_proyecto_final/clases/favoritos.dart';
import 'package:flutter_application_proyecto_final/clases/pelicula.dart';
import 'package:flutter_application_proyecto_final/widgets/boton_favoritos.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class PantallaDetallePelicula extends StatelessWidget {
  const PantallaDetallePelicula({Key key, this.pelicula}) : super(key: key);

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Row(
            children: [
              Text('Detalle de la película'),
              Expanded(
                child: SizedBox(),
              ),
              Consumer<Favoritos>(
                  builder: (context, value, child) =>
                      BotonFavoritos(pelicula: pelicula, color: Colors.black)),
            ],
          ),
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                pelicula.urlFondo != ''
                    ? Image.network(pelicula.urlFondo)
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      pelicula.urlPortada,
                      width: MediaQuery.of(context).size.width / 3.0,
                    ),
                  ),
                ),
              ],
              alignment: AlignmentDirectional.centerStart,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 13.0),
                  Center(
                    child: Text(pelicula.titulo,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Center(
                    child: Text('(' + pelicula.anio + ')',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                  SizedBox(height: 10.0),
                  Center(
                    child: Text(pelicula.idGeneros,
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Center(
                    child: CircularPercentIndicator(
                        radius: 50.0,
                        lineWidth: 4.0,
                        percent: pelicula.score / 10,
                        center: Text(
                            (pelicula.score * 10).round().toString() + '%',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white)),
                        progressColor: pelicula.score >= 7
                            ? Colors.greenAccent[700]
                            : pelicula.score >= 6
                                ? Colors.orangeAccent[400]
                                : Colors.red),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text('Valoración',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Descripcion',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(pelicula.descripcion,
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ],
              ),
            )
          ],
        ),
      );
}
