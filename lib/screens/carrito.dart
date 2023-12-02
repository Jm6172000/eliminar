import 'package:flutter/material.dart';

class CarritoDeCompras extends StatefulWidget {
  const CarritoDeCompras({Key? key}) : super(key: key);

  @override
  _CarritoDeComprasState createState() => _CarritoDeComprasState();
}

class _CarritoDeComprasState extends State<CarritoDeCompras> {
  final List<Producto> productosEnCarrito = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      body: ListView.builder(
        itemCount: productosEnCarrito.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(productosEnCarrito[index].nombre),
            subtitle: Text('\$${productosEnCarrito[index].precio.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                setState(() {
                  productosEnCarrito.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mostrarDialogoAgregarProducto(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _mostrarDialogoAgregarProducto(BuildContext context) async {
    final TextEditingController _nombreController = TextEditingController();
    final TextEditingController _precioController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar Producto'),
          content: Column(
            children: [
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre del Producto'),
              ),
              TextField(
                controller: _precioController,
                decoration: InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final nombre = _nombreController.text;
                final precio = double.tryParse(_precioController.text) ?? 0.0;

                if (nombre.isNotEmpty && precio > 0) {
                  setState(() {
                    productosEnCarrito.add(Producto(nombre, precio));
                  });
                }

                Navigator.of(context).pop();
              },
              child: Text('Agregar'),
            ),
          ],
        );
      },
    );
  }
}

class Producto {
  final String nombre;
  final double precio;

  Producto(this.nombre, this.precio);
}

void main() {
  runApp(MaterialApp(
    home: CarritoDeCompras(),
  ));
}
