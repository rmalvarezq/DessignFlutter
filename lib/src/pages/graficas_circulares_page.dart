import 'package:dessignflutter/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularePage extends StatefulWidget {
  @override
  _GraficasCircularePageState createState() => _GraficasCircularePageState();
}

class _GraficasCircularePageState extends State<GraficasCircularePage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0.0;
            }
            // print('$porcentaje  ');
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.red[400],
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.blue[200],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.green[500],
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.purple[400],
               ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({
    @required this.porcentaje,
    @required this.color,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      // color: Colors.red,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: this.color,
        colorSecundario: Colors.grey,
        grosorPrimario: 10,
        grosorSecundario: 4,
      ),
      // child : Text('$porcentaje %',style: TextStyle(fontSize: 50,),),
    );
  }
}
