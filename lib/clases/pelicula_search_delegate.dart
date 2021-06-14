import 'package:flutter/material.dart';

import 'package:flutter_application_proyecto_final/widgets/query_pelicula.dart';

class PeliculaSearchDelegate extends SearchDelegate {
  var resultado;
  @override
  final String searchFieldLabel;

  PeliculaSearchDelegate(this.searchFieldLabel);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () => this.query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => this.close(context, Text('no salio nada')),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (resultado == null && query.trim().length == 0) {
      return Center(
          child: Text('Ingresa una palabra clave',
              style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w400)));
    } else if (query.trim().length == 0) {
      return resultado;
    } else {
      //Center(
      //child: Text('Ingresa una palabra clave',
      //style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w400)),
      //);

      resultado = QueryPelicula(query: '&query=' + query);
      return resultado;
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return resultado == null
        ? Center(
            child: Text('Ingresa una palabra clave',
                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w400)))
        : resultado;
  }
}
