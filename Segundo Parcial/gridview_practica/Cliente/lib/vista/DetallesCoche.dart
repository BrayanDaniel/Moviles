import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modelo/coche.dart';

class DetallesCoche extends StatelessWidget {
  final Coche coche;

  DetallesCoche({required this.coche});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          coche.modelo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade200, Colors.teal.shade600],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagen del coche
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  child: coche.image,
                ),
              ),
              SizedBox(height: 20),
              // Información en tarjetas
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.directions_car, color: Colors.teal),
                            SizedBox(width: 10),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.teal.shade800,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Marca: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: coche.marca,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(Icons.drive_eta, color: Colors.teal),
                            SizedBox(width: 10),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.teal.shade900,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Modelo: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: coche.modelo,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
