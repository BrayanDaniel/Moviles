import 'package:flutter/material.dart';
import 'package:gridview_practica/controlador/CocheControlador.dart';
import 'package:gridview_practica/vista/DetallesCoche.dart';

class CocheVista extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VistaCocheState();
}

class VistaCocheState extends State<CocheVista> {
  final CocheControlador _cocheControlador = CocheControlador();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true, // Centra el título
        title: Text(
          "COCHES DISPONIBLES",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Número de columnas
          crossAxisSpacing: 10, // Espaciado horizontal entre tarjetas
          mainAxisSpacing: 10, // Espaciado vertical entre tarjetas
          childAspectRatio: 0.85, // Relación de aspecto para las tarjetas
        ),
        itemCount: _cocheControlador.coches.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final item = _cocheControlador.coches[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetallesCoche(coche: item),
                ),
              );
            },
            child: Card(
              elevation: 6.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadowColor: Colors.black54,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.tealAccent, Colors.teal],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: item.image, // Asumiendo que es una imagen tipo Widget
                    ),
                    Text(
                      item.modelo,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      item.marca,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
