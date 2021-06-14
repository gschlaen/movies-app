import 'package:flutter/material.dart';
import 'package:flutter_application_proyecto_final/clases/favoritos.dart';
import 'package:provider/provider.dart';

import 'Pantallas/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favoritos>(
      create: (context) => Favoritos(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DefaultTabController(length: 2, child: MyHomePage()),
      ),
    );
  }
}
