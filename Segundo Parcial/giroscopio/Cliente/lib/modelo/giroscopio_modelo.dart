import 'package:sensors_plus/sensors_plus.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class GiroscopioModelo {
  WebSocketChannel? canal;

  // Detecta los movimientos del giroscopio
  void detectarGiroscopio(Function(double, double, double) onGiroscopioDetectado) {
    gyroscopeEvents.listen((event) {
      onGiroscopioDetectado(event.x, event.y, event.z);
    });
  }

  // Enviar comando al servidor basado en el movimiento
  void enviarComando(String comando) {
    if (canal != null) {
      canal?.sink.add(comando);
    }
  }

  // Establecer la conexión WebSocket
  void conectarServidor(String url) {
    canal = WebSocketChannel.connect(Uri.parse(url));
  }

  // Cerrar la conexión WebSocket
  void desconectar() {
    canal?.sink.close();
  }
}
