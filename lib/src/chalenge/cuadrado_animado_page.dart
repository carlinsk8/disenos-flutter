import 'package:flutter/material.dart';

class CuadradoAnimetePage extends StatelessWidget {
  const CuadradoAnimetePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _CuadradoAnimado()),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin  {
  AnimationController controller;

  Animation<double> moverx1;
  Animation<double> moverx2;
  Animation<double> movery1;
  Animation<double> movery2;

  @override
  void initState() {

    controller = new AnimationController(
      vsync: this, duration: Duration( milliseconds: 2000 )
    );

    moverx1 = Tween(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(parent: controller, curve: Interval( 0, 0.5, curve: Curves.bounceOut ))
    );
    moverx2 = Tween(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(parent: controller, curve: Interval( 0.50, 1.0, curve: Curves.bounceOut ))
    );

    movery1 = Tween(begin: 0.0, end: -20.0).animate(
      CurvedAnimation(parent: controller, curve: Interval( 0.25, 0.50, curve: Curves.bounceOut ))
    );
    movery2 = Tween(begin: 0.0, end: -20.0).animate(
      CurvedAnimation(parent: controller, curve: Interval( 0.75, 1.0, curve: Curves.bounceOut ))
    );

    controller.addListener(() {
      if ( controller.status == AnimationStatus.completed ) {
         controller.repeat();
         //controller.reverse();
        //controller.reset();
      }
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

    // Play / Reproducción
    controller.forward();


    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        return Transform.translate(
          offset: Offset( moverx1.value-moverx2.value, 0/* movery1.value-movery2.value */), 
          child: childRectangulo
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
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
