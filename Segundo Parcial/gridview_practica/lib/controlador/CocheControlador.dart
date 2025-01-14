import 'dart:ui';
import 'package:flutter/material.dart';  // Asegúrate de importar esto para utilizar Image
import '../modelo/coche.dart';

class CocheControlador {
  List<Coche> coches = [
    Coche("Renault", "Clio", Image.asset("images/car1.png")),
    Coche("Citroen", "C3", Image.asset("images/car2.png")),
    Coche("Ford", "Mustang", Image.asset("images/car3.png")),
    Coche("Porsche", "911 Carrera", Image.asset("images/car4.png")),
    Coche("Ferrari", "F8 Tributo", Image.asset("images/car5.png")),
    Coche("Mazda", "MX-5", Image.asset("images/car1.png")),
    Coche("Toyota", "Corolla", Image.asset("images/car2.png")),
    Coche("Chevrolet", "Camaro", Image.asset("images/car3.png")),
    Coche("BMW", "M3", Image.asset("images/car4.png")),
    Coche("Audi", "A4", Image.asset("images/car5.png")),
  ];
}
