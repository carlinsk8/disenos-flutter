import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimary;
  final Color colorSecondary;
  final double barPrimary;
  final double barSecondary;
  final Gradient gradient;
  
  RadialProgress({
    @required this.porcentaje,
    this.colorPrimary   = Colors.blue,
    this.colorSecondary = Colors.grey,
    this.barPrimary     = 10.0,
    this.barSecondary   = 4.0,
    this.gradient
    });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior=widget.porcentaje;
    controller= new AnimationController(vsync: this,duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje-porcentajeAnterior;
    porcentajeAnterior= widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      //child: child,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            child: Center(child: Text("${widget.porcentaje.toInt()}%",
            style: TextStyle(color: widget.colorPrimary,fontWeight: FontWeight.bold),)),
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar)+(diferenciaAnimar*controller.value),
              widget.colorPrimary,
              widget.colorSecondary,
              widget.barSecondary,
              widget.barPrimary,
              widget.gradient
            ),
          ),
        );
      },
    );

    
  }
}

class _MiRadialProgress extends CustomPainter {
  final double porcentaje;
  final Color colorPrimary;
  final Color colorSecondary;
  final double barPrimary;
  final double barSecondary;
  final Gradient gradient;

  _MiRadialProgress(
    this.porcentaje,
    this.colorPrimary,
    this.colorSecondary,
    this.barPrimary,
    this.barSecondary,
    this.gradient
  );

  @override
  void paint(Canvas canvas, Size size) {

    

    final Rect rect = new Rect.fromCircle(
      center: Offset(50, 90),
      radius: 150
    );

    //circulo completo
    final paint = new Paint()
      ..strokeWidth = barPrimary
      ..color       = colorSecondary
      ..style       = PaintingStyle.stroke;

      final center= new Offset(size.width*0.5, size.height/2);
      final radius = min(size.width*0.5, size.height*0.5);

      canvas.drawCircle(center, radius, paint);

      // arco

      final paintArco = new Paint()
      ..strokeWidth = barSecondary
      ..color       = colorPrimary
      ..shader        = gradient!=null?gradient.createShader(rect):null
      ..strokeCap   = StrokeCap.round
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