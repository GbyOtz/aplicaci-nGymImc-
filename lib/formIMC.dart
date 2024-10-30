import 'package:flutter/material.dart';
import 'package:app/dietaScrean.dart';
import 'package:app/ejerciciosScreen.dart';

class IMCFormulario extends StatefulWidget {
  const IMCFormulario({super.key});

  @override
  _IMCFormularioState createState() => _IMCFormularioState();
}

class _IMCFormularioState extends State<IMCFormulario> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  double? _resultadoIMC;
  String _mensajeIMC = '';

  void _calcularIMC() {
    final double peso = double.tryParse(_pesoController.text) ?? 0;
    final double altura = double.tryParse(_alturaController.text) ?? 0;

    if (peso > 0 && altura > 0) {
      final double imc = peso / (altura * altura);
      String interpretacion = _interpretarIMC(imc);

      setState(() {
        _resultadoIMC = imc;
        _mensajeIMC = interpretacion;
      });
    } else {
      setState(() {
        _resultadoIMC = null;
        _mensajeIMC = 'Por favor, ingresa valores válidos.';
      });
    }
  }

  String _interpretarIMC(double imc) {
    if (imc < 18.5) {
      return 'Bajo peso';
    } else if (imc >= 18.5 && imc < 24.9) {
      return 'Peso normal';
    } else if (imc >= 25 && imc < 29.9) {
      return 'Sobrepeso';
    } else {
      return 'Obesidad';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        
        backgroundColor: const Color.fromARGB(255, 121, 196, 124),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          children: [
            const SizedBox(height: 40),
      
            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
                labelStyle: const TextStyle(
                  color: Colors.grey, 
                  fontSize: 18,
                ),
                hintText: 'Ej: 70',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
                prefixIcon: const Icon(Icons.fitness_center, color: Colors.green),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.lightGreen,
                    width: 2.0,
                  ),
                ),
                filled: true,
                fillColor: Colors.lightBlue[50],
              ),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
              cursorColor: Colors.green,
            ),

            const SizedBox(height: 30),
           

            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura (m)',
                labelStyle: const TextStyle(
                  color: Colors.blueGrey, 
                  fontSize: 18,
                ),
                hintText: 'Ej: 1.75',
                hintStyle: const TextStyle(
                  color: Colors.blueGrey,
                  fontStyle: FontStyle.italic,
                ),
                prefixIcon: const Icon(Icons.height, color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Colors.blueGrey,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Colors.lightBlue,
                    width: 2.0,
                  ),
                ),
                filled: true,
                fillColor: Colors.lightBlue[50],
              ),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
              cursorColor: Colors.blue,
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calcularIMC,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 111, 198, 114),
                foregroundColor: const Color.fromARGB(255, 6, 6, 6),
              ),
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 40),

            if (_resultadoIMC != null) ...[
              Card(
                color: Colors.red[100],
                child: ListTile(
                  leading: const Icon(Icons.calculate),
                  title: Text('Tu IMC es: ${_resultadoIMC!.toStringAsFixed(2)}'),
                  subtitle: Text('Estado: $_mensajeIMC'),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.blue[100],
                child: ListTile(
                  leading: const Icon(Icons.fitness_center),
                  title: const Text('Plan de Ejercicio'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EjercicioScreen(estadoIMC: _mensajeIMC),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.orange[100],
                child: ListTile(
                  leading: const Icon(Icons.fastfood),
                  title: const Text('Plan de Comidas'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DietaScreen(estadoIMC: _mensajeIMC),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}