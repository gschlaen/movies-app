import 'package:flutter/material.dart';
import 'package:flutter_application_proyecto_final/Pantallas/pantalla_favoritos.dart';
import 'package:flutter_application_proyecto_final/clases/pelicula_search_delegate.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("APPTIVAWEB"),
            accountEmail: Text("informes@gmail.com"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://ichef.bbci.co.uk/news/660/cpsprodpb/6AFE/production/_102809372_machu.jpg"),
                    fit: BoxFit.cover)),
          ),
          Ink(
            color: Colors.orange,
            child: ListTile(
              leading: Icon(Icons.search),
              title: Text(
                "BUSCAR PELICULAS",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => showSearch(
                context: context,
                delegate: PeliculaSearchDelegate(' Buscar...'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text("FAVORITOS"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PantallaFavoritos())),
          ),
        ],
      ),
    );
  }
}
