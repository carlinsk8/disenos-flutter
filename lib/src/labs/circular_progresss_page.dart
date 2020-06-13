import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularPogressPAge extends StatefulWidget {
  CircularPogressPAge({Key key}) : super(key: key);

  @override
  _CircularPogressPAgeState createState() => _CircularPogressPAgeState();
}

class _CircularPogressPAgeState extends State<CircularPogressPAge> with SingleTickerProviderStateMixin{
  
  AnimationController controller;

  double porcentaje = 0.0;
  double nuevoPorcentaje=0.0;
  
  @override
  void initState() {
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener(() {
      //print("Valor controller: ${controller.value}");
      setState(() {
        porcentaje=lerpDouble(porcentaje, nuevoPorcentaje, controller.value);
      });
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.orange,
        onPressed: (){
          controller.forward(from: 0.0);
          setState(() {
            porcentaje=nuevoPorcentaje;
            nuevoPorcentaje+=10;
            if (nuevoPorcentaje>100) {
              nuevoPorcentaje=0;
              porcentaje=0;
            }
          });
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300.0,
          height: 300.0,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje)
          ),
        ),
      ),
    );
  }
}

 class _MiRadialProgress extends CustomPainter {
   final porcentaje;
   _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {

    //circulo completo
    final paint = new Paint()
      ..strokeWidth = 8
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

      final center= new Offset(size.width*0.5, size.height/2);
      final radius = min(size.width*0.5, size.height*0.5);

      canvas.drawCircle(center, radius, paint);

      // arco

      final paintArco = new Paint()
      ..strokeWidth = 10
      ..color       = Colors.orange
      ..style       = PaintingStyle.stroke;

      // llenado

      double arcAngle = 2 * pi * (porcentaje/100);

      canvas.drawArc(
        Rect.fromCircle(center:center,radius: radius), 
        -pi/2, 
        arcAngle, 
        false, 
        paintArco
      );


  }

  @override
  bool shouldRepaint(_MiRadialProgress oldDelegate) => true;
}