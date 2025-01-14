import asyncio
import websockets
import webbrowser

async def handler(websocket, path=None):
    print(f"Cliente conectado: {websocket.remote_address}")
    try:
        async for message in websocket:
            print(f"Mensaje recibido: {message}")
            if message == "Abrir página web":
                try:
                    print("Intentando abrir el enlace de diseño de patrones...")
                    webbrowser.open('https://refactoring.guru/es/design-patterns')
                except Exception as e:
                    print(f"Error al abrir el enlace: {e}")
            elif message == "Abrir aplicación ofimática":
                try:
                    print("Intentando abrir el enlace de Google Sheets...")
                    webbrowser.open('https://docs.google.com/spreadsheets/d/0B7uNrThIIZTmeWZka2ZvemUtYkE/edit?gid=1307076623&resourcekey=0-2Be8unJoKd74W_jnqGKNaQ#gid=1307076623')
                except Exception as e:
                    print(f"Error al abrir el enlace: {e}")
            elif message == "Reproducir contenido multimedia":
                try:
                    print("Intentando abrir WhatsApp Web...")
                    webbrowser.open('https://youtube.com')
                except Exception as e:
                    print(f"Error al abrir el enlace: {e}")
    except websockets.ConnectionClosed as e:
        print(f"Cliente desconectado: {websocket.remote_address} con error {e}")
    finally:
        print(f"Cliente desconectado: {websocket.remote_address}")

async def main():
    async with websockets.serve(handler, "0.0.0.0", 8765):
        print("Servidor WebSocket escuchando en ws://0.0.0.0:8765")
        await asyncio.Future()  # run forever

if __name__ == "__main__":
    asyncio.run(main())
