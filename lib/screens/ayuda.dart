import 'package:flutter/material.dart';

class AyudaPage extends StatefulWidget {
  const AyudaPage({Key? key}) : super(key: key);

  @override
  _AyudaPageState createState() => _AyudaPageState();
}

class _AyudaPageState extends State<AyudaPage> {
  final List<String> mensajes = [];
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _quejaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicio de Ayuda'),
      ),
      body: Column(
        children: <Widget>[
        

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOptionBox(
                context,
                'Quejas',
                '¿Algo no fue como esperabas?¿No te entregaron tu pedido?',
                Colors.orange.shade100,
                onOptionSelected: () => _showInputDialog('Quejas'),
              ),
              _buildOptionBox(
                context,
                'Sugerencias',
                '¿Tienes ideas para mejorar nuestra plataforma?',
                Colors.green.shade100, 
                onOptionSelected: () => _showInputDialog('Sugerencias'),
              ),
            ],
          ),

          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: mensajes.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    mensajes[index],
                    style: TextStyle(fontSize: 16.0),
                  ),
                );
              },
            ),
          ),

          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¿Necesitas más ayuda?',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Si tus preguntas no fueron respondidas, estamos aquí para ayudarte. ¡Contacta con nosotros!',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
          
                  },
                  child: Text('Obtener más ayuda'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildOptionBox(BuildContext context, String title, String description, Color color,
      {VoidCallback? onOptionSelected}) {
    return Expanded(
      child: GestureDetector(
        onTap: onOptionSelected,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showInputDialog(String option) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Escribir $option'),
          content: Column(
            children: [
              TextField(
                controller: _quejaController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Escribe aquí tu $option',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _enviarQueja();
                  Navigator.of(context).pop();
                },
                child: Text('Enviar $option'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _enviarQueja() {
    setState(() {
      mensajes.add(_quejaController.text);
      _quejaController.clear();
   
    });
  }
}
