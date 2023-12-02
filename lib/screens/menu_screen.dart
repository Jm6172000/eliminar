import 'package:app_movil1/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:app_movil1/screens/home_screen.dart';
import 'package:app_movil1/screens/formulario_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://swapiio.netlify.app/dark_swapii.png',
          fit: BoxFit.cover,
          height: 50,
          width: 50,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => form(),
                ),
              );
            },
            child: Text('Iniciar Sesión', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormulariosScreen(),
                ),
              );
            },
            child: Text('Crear Cuenta', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.network(
            'https://neubox.com/blog/wp-content/uploads/2021/11/860x436-TIENDA.webp',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: Container(
              color: Colors.blue[50],
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Quiénes somos',
                    style: TextStyle(fontSize: 30, color: Colors.black, fontFamily: 'Roboto'),
                  ),
                  Text(
                    'Swapii es una plataforma de compra, venta e intercambio dentro de la Universidad Tecnologica de Durango . Nuestra mision es brindar servicios de calidad a nuestros usuarios.',
                    style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Roboto'),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, 
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Sugerencias'),
                            content: TextField(
                              decoration: InputDecoration(hintText: "Escribe aquí tu sugerencia..."),
                            ),
                            actions: [
                              TextButton(
                                child: Text('Enviar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.lightbulb_outline),
                    label: Text('Sugerencias'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
