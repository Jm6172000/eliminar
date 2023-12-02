import 'package:flutter/material.dart';
import 'package:app_movil1/screens/carrito.dart';
import 'package:app_movil1/screens/screens.dart';
import 'package:app_movil1/screens/suscripcion.dart';
import 'package:app_movil1/screens/usuario.dart';
import 'package:app_movil1/screens/mensajes.dart';
import 'package:app_movil1/screens/producto.dart';
import 'package:app_movil1/screens/ayuda.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swapii', style: TextStyle(fontSize: 25, color: Colors.white)),
        leading: PopupMenuButton<int>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.black),
                  Text('Subir producto'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: Row(
                children: [
                  Icon(Icons.message, color: Colors.black),
                  Text('Mensajes'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 3,
              child: Row(
                children: [
                  Icon(Icons.shopping_cart, color: Colors.black),
                  Text('Carrito'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 4,
              child: Row(
                children: [
                  Icon(Icons.subscriptions, color: Colors.black),
                  Text('Suscripcion'),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Productos(),
                  ),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Mensajes(),
                  ),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarritoDeCompras(),
                  ),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SusScreen(),
                  ),
                );
                break;
          
            }
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Usuario(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.help, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AyudaPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildProductCard(context, 'Termo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaW080piOoPGF5S-NInTMIFRG6TIU-t12M3A&usqp=CAUS', '\$100.00'),
          _buildProductCard(context, 'Sudadera Azul', 'https://down-mx.img.susercontent.com/file/f1f62c86d6f07aeae4ece47aeaffccc2_tn', '\$65.99'),
          _buildProductCard(context, 'Colcha de Dragon Ball', 'https://i5.walmartimages.com.mx/mg/gm/3pp/asr/efedd7c8-49e0-4259-9bf0-e672e63f2d70.97304ee029d567329aa88d9e759ad733.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF', '\$250.50'),
          _buildProductCard(context, 'Sudadera', 'https://http2.mlstatic.com/D_NQ_NP_956770-MLM71751011779_092023-O.webp', '\$1200.00'),
          _buildProductCard(context, 'Telefono', 'https://i5.walmartimages.com.mx/mg/gm/3pp/asr/4b23f53a-d39e-43de-a4f5-1a2500ee9e7e.0cba5d76b287a9ee9f104f4fee50ddeb.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF', '\$1565.99'),
          _buildProductCard(context, 'Perrito labrador', 'https://www.eloccidental.com.mx/incoming/gvhext-richard-burlton-htpmedsyzag-unsplash.jpg/ALTERNATES/LANDSCAPE_768/richard-burlton-HTpmedSyZag-unsplash.jpg', '\$250.50'),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String title, String imageUrl, String price) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.network(
                imageUrl, 
                height: 100,
                width: 100, // Tamaño de la imagen
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Text('Error al cargar la imagen');
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                 
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Guardado en el carrito'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 20, color: Colors.black)),
          Text(price, style: TextStyle(fontSize: 16, color: Colors.green)),
        ],
      ),
    );
  }
}
