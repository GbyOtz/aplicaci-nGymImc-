import 'package:flutter/material.dart';

class EjercicioScreen extends StatelessWidget {
  final String estadoIMC;

  const EjercicioScreen({super.key, required this.estadoIMC});

  List<Widget> _obtenerPlanEjercicio(BuildContext context, String estado) {
    List<Widget> ejercicios = [];

    switch (estado) {
      case 'Bajo peso':
        ejercicios.addAll([
          _crearCard(
            context,
            'Entrenamiento de fuerza',
            '3 veces por semana. Incluye ejercicios como levantamiento de pesas, sentadillas y flexiones.',
            _obtenerImagenPorEstadoYTipo(estado, 'Entrenamiento de fuerza'),
            'Es recomendable realizar 3 series de 8 a 12 repeticiones para cada ejercicio. Enfócate en ejercicios compuestos como peso muerto y press de banca para desarrollar masa muscular.',
          ),
          _crearCard(
            context,
            'Caminatas ligeras',
            'Caminatas ligeras o ejercicios de bajo impacto. Asegúrate de calentar antes de cada sesión.',
            _obtenerImagenPorEstadoYTipo(estado, 'Caminatas ligeras'),
            'Intenta realizar caminatas de 30 minutos. Mantén un paso moderado y usa calzado cómodo. Puedes aumentar la duración semanalmente.',
          ),
          _crearCard(
            context,
            'Yoga',
            'Yoga para aumentar flexibilidad y equilibrio. Practica al menos 2 veces por semana.',
            _obtenerImagenPorEstadoYTipo(estado, 'Yoga'),
            'Realiza sesiones de 30 minutos enfocadas en posturas de equilibrio y respiración. El yoga ayuda a reducir el estrés y mejorar la movilidad.',
          ),
        ]);
        break;

      case 'Peso normal':
        ejercicios.addAll([
          _crearCard(
            context,
            'Ejercicio aeróbico moderado',
            'Correr o nadar 5 veces por semana. Mantén un ritmo que puedas sostener.',
            _obtenerImagenPorEstadoYTipo(estado, 'Ejercicio aeróbico moderado'),
            'Se recomienda un ritmo moderado de 30 a 45 minutos. Aumenta la intensidad de forma progresiva para evitar lesiones.',
          ),
          _crearCard(
            context,
            'Entrenamiento de fuerza',
            'Entrenamiento de fuerza 2 veces por semana. Incluye ejercicios de cuerpo completo.',
            _obtenerImagenPorEstadoYTipo(estado, 'Entrenamiento de fuerza'),
            'Haz 2-3 series de 8 a 12 repeticiones, con foco en ejercicios de cuerpo completo como sentadillas y peso muerto para mantener la musculatura.',
          ),
          _crearCard(
            context,
            'Estiramientos y yoga',
            'Estiramientos y yoga para flexibilidad. Ideal al final de cada sesión de entrenamiento.',
            _obtenerImagenPorEstadoYTipo(estado, 'Estiramientos y yoga'),
            'Dedica al menos 10 minutos después de cada sesión para estirar, especialmente piernas y espalda, para mejorar la recuperación muscular.',
          ),
        ]);
        break;

      case 'Sobrepeso':
        ejercicios.addAll([
          _crearCard(
            context,
            'Ejercicio aeróbico suave',
            'Caminar o andar en bicicleta 4 veces por semana. Empieza con 30 minutos y aumenta gradualmente.',
            _obtenerImagenPorEstadoYTipo(estado, 'Ejercicio aeróbico suave'),
            'Realiza caminatas de 30 a 40 minutos a un ritmo cómodo, e incrementa el tiempo a medida que te sientas más cómodo.',
          ),
          _crearCard(
            context,
            'Entrenamiento de resistencia',
            'Entrenamiento de resistencia con pesas ligeras. 2 veces por semana.',
            _obtenerImagenPorEstadoYTipo(
                estado, 'Entrenamiento de resistencia'),
            'Utiliza pesas ligeras o bandas de resistencia para mejorar fuerza y tono muscular. Concéntrate en una buena técnica y movimientos controlados.',
          ),
          _crearCard(
            context,
            'Ejercicios de movilidad',
            'Ejercicios de movilidad y estiramientos. Prioriza la consistencia y la buena técnica.',
            _obtenerImagenPorEstadoYTipo(estado, 'Ejercicios de movilidad'),
            'Dedica 10 a 15 minutos diarios a estiramientos y ejercicios de movilidad, especialmente para las caderas y los hombros.',
          ),
        ]);
        break;

      case 'Obesidad':
        ejercicios.addAll([
          _crearCard(
            context,
            'Caminatas suaves',
            '5 veces por semana. Comienza con caminatas de 20 minutos y aumenta la duración gradualmente.',
            _obtenerImagenPorEstadoYTipo(estado, 'Caminatas suaves'),
            'Comienza con caminatas de baja intensidad, aumentando 5 minutos por semana hasta alcanzar una hora diaria.',
          ),
          _crearCard(
            context,
            'Ejercicio de bajo impacto',
            'Ejercicios de bajo impacto como bicicleta estática o natación. Estas opciones son más suaves para las articulaciones.',
            _obtenerImagenPorEstadoYTipo(estado, 'Ejercicio de bajo impacto'),
            'Realiza actividades de bajo impacto de 20 a 30 minutos, evitando el impacto en las articulaciones y mejorando la resistencia cardiovascular.',
          ),
          _crearCard(
            context,
            'Yoga y estiramientos suaves',
            'Yoga y estiramientos suaves para mejorar la movilidad. Incluye estas actividades 2-3 veces por semana.',
            _obtenerImagenPorEstadoYTipo(estado, 'Yoga y estiramientos suaves'),
            'Haz ejercicios de estiramiento o yoga suave, enfocándote en la respiración y relajación, lo que ayuda en la reducción de estrés.',
          ),
        ]);
        break;

      default:
        ejercicios.add(
          const Text('No se encontró un plan de ejercicio para este estado.'),
        );
    }

    return ejercicios;
  }

  Widget _crearCard(BuildContext context, String tipoEjercicio, String detalle,
      Widget imagen, String detalleExtendido) {
    return GestureDetector(
      onTap: () =>
          _mostrarModal(context, tipoEjercicio, detalle, detalleExtendido),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tipoEjercicio,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              imagen,
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(Icons.fitness_center, color: Colors.blue),
                  const SizedBox(width: 8.0),
                  Expanded(child: Text(detalle)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarModal(BuildContext context, String tipoEjercicio, String detalle,
      String detalleExtendido) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalles de $tipoEjercicio'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(detalle),
              const SizedBox(height: 8.0),
              Text(
                detalleExtendido,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
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

  Widget _obtenerImagenPorEstadoYTipo(String estado, String tipo) {
    String imagenPath;

    switch (tipo) {
      case 'Entrenamiento de fuerza':
        imagenPath = estado == 'Bajo peso'
            ? 'assets/bajo 1.jpeg'
            : estado == 'Peso normal'
                ? 'assets/normal 2.jpeg'
                : estado == 'Sobrepeso'
                    ? 'assets/sobre 1.jpeg'
                    : 'assets/obe 1.jpeg';
        break;
      case 'Caminatas ligeras':
        imagenPath = estado == 'Bajo peso'
            ? 'assets/bajo 2.jpeg'
            : estado == 'Peso normal'
                ? 'assets/normal 2.jpeg'
                : estado == 'Sobrepeso'
                    ? 'assets/sobre 2.jpeg'
                    : 'assets/obe 2.jpeg';
        break;
      case 'Yoga':
        imagenPath = estado == 'Bajo peso'
            ? 'assets/bajo 3.jpeg'
            : estado == 'Peso normal'
                ? 'assets/normal 3.jpeg'
                : estado == 'Sobrepeso'
                    ? 'assets/sobre 3.jpeg'
                    : 'assets/obe 3.jpeg';
        break;
      case 'Ejercicio aeróbico moderado':
        imagenPath = 'assets/normal 1.jpeg';
        break;
      case 'Entrenamiento de fuerza':
        imagenPath = 'assets/normal 2.jpeg';
        break;
      case 'Estiramientos y yoga':
        imagenPath = 'assets/normal 3.jpeg';
        break;
      case 'Ejercicio aeróbico suave':
        imagenPath = 'assets/sobre 1.jpeg';
        break;
      case 'Entrenamiento de resistencia':
        imagenPath = 'assets/sobre 2.jpeg';
        break;
      case 'Ejercicios de movilidad':
        imagenPath = 'assets/sobre 3.jpeg';
        break;
      case 'Caminatas suaves':
        imagenPath = 'assets/obe 1.jpeg';
        break;
      case 'Ejercicio de bajo impacto':
        imagenPath = 'assets/obe 2.jpeg';
        break;
      case 'Yoga y estiramientos suaves':
        imagenPath = 'assets/obe 3.jpeg';
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
        title: const Text('Plan de Ejercicio Detallado'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: _obtenerPlanEjercicio(context, estadoIMC),
          ),
        ),
      ),
    );
  }
}