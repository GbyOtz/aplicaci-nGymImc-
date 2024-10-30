import 'package:flutter/material.dart';

class DietaScreen extends StatelessWidget {
  final String estadoIMC;

  const DietaScreen({super.key, required this.estadoIMC});

  List<Widget> _obtenerPlanComidas(BuildContext context, String estado) {
  List<Widget> comidas = [];

  switch (estado) {
    case 'Bajo peso':
      comidas.addAll([
        _crearCard(context, 'Desayuno', [
          'Avena con frutas y nueces.',
          'Batido de proteínas.',
        ], 
        'Paso 1: Preparar la avena. Cocinar a fuego medio durante 5-10 minutos.\nPaso 2: Añadir frutas y nueces.\nConsejo: Puedes usar leche o agua según tu preferencia.'),
        
        _crearCard(context, 'Almuerzo', [
          'Arroz con frijoles, pollo a la plancha.',
          'Ensalada con aguacate.',
        ], 
        'Paso 1: Cocinar el arroz. Hervir en agua durante 20 minutos.\nPaso 2: Cocinar el pollo a la plancha por 6-7 minutos por lado.\nConsejo: Marinar el pollo con especias para más sabor.'),
        
        _crearCard(context, 'Cena', [
          'Pasta integral con vegetales.',
          'Pescado a la plancha.',
        ], 
        'Paso 1: Hervir la pasta durante 8-10 minutos.\nPaso 2: Cocinar el pescado a la plancha durante 5 minutos por lado.\nConsejo: Añade un chorrito de limón al pescado antes de servir.'),
      ]);
      break;

    case 'Peso normal':
      comidas.addAll([
        _crearCard(context, 'Desayuno', [
          'Yogur con frutas y granola.',
          'Pan integral con aguacate.',
        ], 
        'Paso 1: Mezclar yogur con frutas. Puedes usar frutas de temporada.\nPaso 2: Servir con granola.\nConsejo: Elige una granola baja en azúcar.'),
        
        _crearCard(context, 'Almuerzo', [
          'Ensalada de verduras frescas con proteína magra.',
          'Pescado al horno con quinua.',
        ], 
        'Paso 1: Preparar ensalada con lechuga, tomate y pepino. Añadir tu proteína magra favorita.\nPaso 2: Hornear el pescado a 180°C durante 20 minutos.\nConsejo: Usa especias como ajo y orégano para sazonar.'),
        
        _crearCard(context, 'Cena', [
          'Pavo al horno con ensalada de vegetales.',
          'Sopas ligeras.',
        ], 
        'Paso 1: Cocinar el pavo a 180°C durante 25-30 minutos.\nPaso 2: Preparar la sopa con caldo y verduras de tu elección.\nConsejo: Agrega hierbas frescas para un sabor adicional.'),
      ]);
      break;

    case 'Sobrepeso':
      comidas.addAll([
        _crearCard(context, 'Desayuno', [
          'Smoothie verde de vegetales y frutas.',
          'Avena con leche de almendras.',
        ], 
        'Paso 1: Mezclar espinacas, plátano y un poco de agua o leche en la licuadora.\nPaso 2: Servir en un vaso grande.\nConsejo: Añadir proteína en polvo para un extra de energía.'),
        
        _crearCard(context, 'Almuerzo', [
          'Ensalada verde con pollo a la parrilla.',
          'Sopa de verduras.',
        ], 
        'Paso 1: Preparar la ensalada con lechuga, pollo a la parrilla y tu aderezo favorito.\nPaso 2: Cocinar la sopa durante 20 minutos.\nConsejo: Usa pollo marinado para más sabor.'),
        
        _crearCard(context, 'Cena', [
          'Verduras asadas con tofu o pechuga de pavo.',
          'Pescado al vapor con ensalada ligera.',
        ], 
        'Paso 1: Asar las verduras a 200°C durante 20-25 minutos.\nPaso 2: Cocinar el pescado al vapor durante 10 minutos.\nConsejo: Sirve con salsa de soya o limón.'),
      ]);
      break;

    case 'Obesidad':
      comidas.addAll([
        _crearCard(context, 'Desayuno', [
          'Fruta fresca y avena con leche descremada.',
        ], 
        'Paso 1: Cocinar la avena con leche descremada durante 5-10 minutos.\nPaso 2: Añadir frutas frescas por encima.\nConsejo: Opta por frutas ricas en fibra como manzanas o peras.'),
        
        _crearCard(context, 'Almuerzo', [
          'Sopa de vegetales sin grasa.',
          'Pollo a la plancha con ensalada de espinacas.',
        ], 
        'Paso 1: Cocinar la sopa con caldo de verduras y tus vegetales favoritos.\nPaso 2: Cocinar el pollo a la plancha durante 6-7 minutos por lado.\nConsejo: Añadir especias para potenciar el sabor de la sopa.'),
        
        _crearCard(context, 'Cena', [
          'Ensalada con legumbres (lentejas, garbanzos).',
          'Pescado a la parrilla con verduras al vapor.',
        ], 
        'Paso 1: Mezclar legumbres cocidas con verduras frescas.\nPaso 2: Cocinar el pescado a la parrilla durante 5-6 minutos por lado.\nConsejo: Sirve con aceite de oliva y limón.'),
      ]);
      break;

    default:
      comidas.add(
          const Text('No se encontró un plan de comidas para este estado.'));
  }

  return comidas;
}


  Widget _crearCard(BuildContext context, String comida, List<String> items, String pasosPreparacion) {
    return GestureDetector(
      onTap: () => _mostrarModalPreparacion(context, comida, pasosPreparacion),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comida,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              _obtenerImagenPorEstadoYComida(estadoIMC, comida),
              const SizedBox(height: 8.0),
              ...items.map((item) => Row(
                    children: [
                      const Icon(Icons.food_bank, color: Colors.orange),
                      const SizedBox(width: 8.0),
                      Expanded(child: Text(item)),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarModalPreparacion(BuildContext context, String comida, String pasosPreparacion) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Preparación de $comida'),
          content: Text(pasosPreparacion),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  Widget _obtenerImagenPorEstadoYComida(String estado, String comida) {
    String imagenPath;

    switch (estado) {
      case 'Bajo peso':
        switch (comida) {
          case 'Desayuno':
            imagenPath = 'assets/desayuno_bajo.jpeg';
            break;
          case 'Almuerzo':
            imagenPath = 'assets/almuerzo_bajo.jpeg';
            break;
          case 'Cena':
            imagenPath = 'assets/cena_bajo.jpeg';
            break;
          default:
            imagenPath = 'assets/images/default.jpg'; //?
        }
        break;

      case 'Peso normal':
        switch (comida) {
          case 'Desayuno':
            imagenPath = 'assets/desayuno_normal.jpeg';
            break;
          case 'Almuerzo':
            imagenPath = 'assets/almuerzo_normal.jpg';
            break;
          case 'Cena':
            imagenPath = 'assets/cena_normal.jpg';
            break;
          default:
            imagenPath = 'assets/images/default.jpg';
        }
        break;

      case 'Sobrepeso':
        switch (comida) {
          case 'Desayuno':
            imagenPath = 'assets/desayuno_sobre.jpg';
            break;
          case 'Almuerzo':
            imagenPath = 'assets/almuerzo_sobre.jpg';
            break;
          case 'Cena':
            imagenPath = 'assets/cena_sobre.jpg';
            break;
          default:
            imagenPath = 'assets/images/default.jpg';
        }
        break;

      case 'Obesidad':
        switch (comida) {
          case 'Desayuno':
            imagenPath = 'assets/desayuno_ob.jpg';
            break;
          case 'Almuerzo':
            imagenPath = 'assets/almuerzo_obe.jpg';
            break;
          case 'Cena':
            imagenPath = 'assets/cena_ob.jpg';
            break;
          default:
            imagenPath = 'assets/images/default.jpg';
        }
        break;

      default:
        imagenPath = 'assets/images/default.jpg';
    }

    return Image.asset(
      imagenPath,
      height: 100,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan de Comidas Detallado'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: _obtenerPlanComidas(context, estadoIMC),
          ),
        ),
      ),
    );
  }
}