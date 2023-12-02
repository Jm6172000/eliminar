import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:app_movil1/screens/home_screen.dart';

class Productos extends StatefulWidget {
  Productos({Key? key}) : super(key: key);

  @override
  _ProductoState createState() => _ProductoState();
}

class _ProductoState extends State<Productos> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreProductoController = TextEditingController();
  final TextEditingController _nombreUsuarioController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _cantidadController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  late String _imagenPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreProductoController,
                decoration: const InputDecoration(labelText: 'Nombre del Producto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa un nombre para el producto';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  final picker = ImagePicker();
                  final pickedFile = await picker.getImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    setState(() {
                      _imagenPath = pickedFile.path;
                    });
                  }
                },
                child: const Text('Cargar Imagen'),
              ),
              TextFormField(
                controller: _nombreUsuarioController,
                decoration: const InputDecoration(labelText: 'Nombre de Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa un nombre de usuario';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _precioController,
                decoration: const InputDecoration(labelText: 'Precio'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa un precio';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _cantidadController,
                decoration: const InputDecoration(labelText: 'Cantidad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa una cantidad';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa una descripción';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final nombreProducto = _nombreProductoController.text;
                    final nombreUsuario = _nombreUsuarioController.text;
                    final precio = _precioController.text;
                    final cantidad = _cantidadController.text;
                    final descripcion = _descripcionController.text;

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Datos Ingresados'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Nombre del Producto: $nombreProducto'),
                              if (_imagenPath != null) Image.file(File(_imagenPath)),
                              Text('Nombre de Usuario: $nombreUsuario'),
                              Text('Precio: $precio'),
                              Text('Cantidad: $cantidad'),
                              Text('Descripción: $descripcion'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                // Navigating to HomeScreen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              },
                              child: const Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Subir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
