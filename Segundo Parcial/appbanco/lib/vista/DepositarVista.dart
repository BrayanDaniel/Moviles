import 'package:flutter/material.dart';
import '../controlador/MovimientoControlador.dart';
import 'package:provider/provider.dart';

class DepositarVista extends StatefulWidget {
  @override
  _DepositarVistaState createState() => _DepositarVistaState();
}

class _DepositarVistaState extends State<DepositarVista> {
  final _formKey = GlobalKey<FormState>();
  final _controladorCuenta = TextEditingController();
  final _controladorImporte = TextEditingController();

  @override
  void dispose() {
    _controladorCuenta.dispose();
    _controladorImporte.dispose();
    super.dispose();
  }

  void _realizarDeposito() async {
    if (_formKey.currentState!.validate()) {
      final cuenta = _controladorCuenta.text.trim();
      final importe = double.tryParse(_controladorImporte.text.trim()) ?? 0.0;

      // Dato quemado para código de empleado
      const codEmp = '0001';

      // Usamos el proveedor para acceder al controlador
      final exito = await Provider.of<MovimientoControlador>(context, listen: false)
          .depositar(cuenta, importe, codEmp);

      if (exito) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Depósito realizado con éxito',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );
        _controladorCuenta.clear();
        _controladorImporte.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error al realizar el depósito',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Depositar',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xFF9B4D97),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _controladorCuenta,
                decoration: InputDecoration(
                  labelText: 'Número de cuenta',
                  labelStyle: TextStyle(color: Color(0xFF9B4D97)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF9B4D97)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF9B4D97), width: 2),
                  ),
                ),
                style: TextStyle(color: Color(0xFF9B4D97)),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, ingrese el número de cuenta';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _controladorImporte,
                decoration: InputDecoration(
                  labelText: 'Importe',
                  labelStyle: TextStyle(color: Color(0xFF9B4D97)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF9B4D97)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF9B4D97), width: 2),
                  ),
                ),
                style: TextStyle(color: Color(0xFF9B4D97)),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, ingrese el importe';
                  }
                  final importe = double.tryParse(value);
                  if (importe == null || importe <= 0) {
                    return 'Ingrese un importe válido mayor a 0';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _realizarDeposito,
                child: Text(
                  'Depositar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9B4D97),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
