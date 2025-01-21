import 'package:flutter/material.dart';
import 'MovimientosVista.dart'; // Asegúrate de tener importada MovimientosVista

class LoginVista extends StatefulWidget {
  const LoginVista({super.key});

  @override
  _LoginVistaState createState() => _LoginVistaState();
}

class _LoginVistaState extends State<LoginVista> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  bool _obscureText = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      String usuario = _usuarioController.text;
      String contrasena = _contrasenaController.text;

      if (usuario == "admin" && contrasena == "admin") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MovimientosVista(usuarioLogueado: usuario),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuario o contraseña incorrectos')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acceso a la Aplicación'),
        backgroundColor: const Color(0xFF9B4D97),
        centerTitle: true,
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50),
                  // Ícono circular grande para representar el login
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: const Color(0xFF9B4D97),
                    child: const Icon(
                      Icons.login,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Bienvenido',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF9B4D97),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _usuarioController,
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      labelStyle: const TextStyle(color: Color(0xFF9B4D97)),
                      prefixIcon: const Icon(Icons.person, color: Color(0xFF9B4D97)),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(color: Color(0xFF9B4D97)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un usuario';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _contrasenaController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: const TextStyle(color: Color(0xFF9B4D97)),
                      prefixIcon: const Icon(Icons.lock, color: Color(0xFF9B4D97)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Color(0xFF9B4D97),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(color: Color(0xFF9B4D97)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese una contraseña';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9B4D97),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
