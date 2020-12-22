import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  // Animation
  AnimationController controller;
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    rotacion = Tween(begin: 0.0, end: 2 * Math.pi)
        .animate(CurvedAnimation(curve: Curves.easeInOut, parent: controller));
    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        curve: Interval(0, 0.25, curve: Curves.bounceInOut),
        parent: controller));
    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        curve: Interval(0.75, 1.0, curve: Curves.bounceInOut),
        parent: controller));
    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(
        curve: Interval(0, 0.25, curve: Curves.easeInOut), parent: controller));

    agrandar = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
        curve: Interval(0, 0.25, curve: Curves.easeInOut), parent: controller));

    controller.addListener(() {
      // print('Status: $controller.status');
      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        // controller.reset();
        controller.repeat();
      }
      // else if(controller.status == AnimationStatus.dismissed){
      //   controller.forward();

      // }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Play a la animación
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        // print( 'rotacion: '+'$rotacion.value');
      // print('Opacidad: $opacidad.status');
      // print('Opacidad: $opacidad.value');
      // print('Rotación: $rotacion.status');
      // print('Rotación: $rotacion.value');
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                  opacity: opacidad.value - opacidadOut.value,
                  child: Transform.scale(
                    scale: agrandar.value,
                    child: childRectangulo))),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.red),
    );
  }
}
