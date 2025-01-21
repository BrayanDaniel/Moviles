import 'package:flutter/material.dart';
import 'ConsultarMovimientosVista.dart';
import 'DepositarVista.dart';
import 'RetirarVista.dart';
import 'TransferirVista.dart';
import 'LoginVista.dart';

class MovimientosVista extends StatefulWidget {
  final String usuarioLogueado;

  MovimientosVista({required this.usuarioLogueado});

  @override
  _MovimientosVistaState createState() => _MovimientosVistaState();
}

class _MovimientosVistaState extends State<MovimientosVista> {
  int _currentIndex = 0; // Controla la pantalla activa.

  // Páginas de contenido
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    // Definimos las páginas, incluyendo la pantalla de bienvenida
    _pages = [
      _buildBienvenida(), // Página de bienvenida
      DepositarVista(),
      RetirarVista(),
      TransferirVista(),
      ConsultarMovimientosVista(),
    ];
  }

  // Página de bienvenida con un mensaje personalizado
  Widget _buildBienvenida() {
    return Center(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.wallet, size: 100, color: Color(0xFF9B4D97)),
              const SizedBox(height: 20),
              Text(
                '¡Bienvenido, ${widget.usuarioLogueado}!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9B4D97),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Selecciona una opción del menú para comenzar.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Movimientos',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: const Color(0xFF9B4D97), // Color morado
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                widget.usuarioLogueado,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              accountEmail: Text(
                "${widget.usuarioLogueado}@ejemplo.com",
                style: const TextStyle(color: Colors.white),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Color(0xFF9B4D97)),
              ),
              decoration: const BoxDecoration(color: Color(0xFF9B4D97)),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Color(0xFF9B4D97)),
              title: const Text(
                'Perfil',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9B4D97)),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF9B4D97)),
              title: const Text(
                'Configuración',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9B4D97)),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFF9B4D97)),
              title: const Text(
                'Cerrar Sesión',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9B4D97)),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginVista()),
                );
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex], // Muestra la página correspondiente
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(0xFF9B4D97),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Depósito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off),
            label: 'Retiro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Transferencia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Movimientos',
          ),
        ],
      ),
    );
  }
}
