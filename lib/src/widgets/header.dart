import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
        )
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  new Paint();

    lapiz.color=Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    final path = Path();

    path.moveTo(0, size.height *0.35);
    path.lineTo(size.height, size.height *0.30);
    path.lineTo(size.height, 0);
    path.lineTo(0,0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return true;
  }

}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  new Paint();

    lapiz.color=Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    final path = Path();

    path.lineTo(size.width, size.height );
    path.lineTo(size.height, 0);
    
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return true;
  }

}

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  new Paint();

    lapiz.color=Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    final path = Path();
    path.lineTo(0, size.height *0.25);
    path.lineTo(size.width *0.5, size.height *0.30 );
    path.lineTo(size.width  , size.height *0.25 );
    path.lineTo(size.width  , 0 );
   // path.lineTo(size.width *0.5, size.height *0.35);
   // path.lineTo(size.height *0.35, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return true;
  }

}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  new Paint();

    lapiz.color=Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    final path = Path();
    path.lineTo(0, size.height *0.25);
    path.quadraticBezierTo(size.width*0.50, size.height *0.35, size.width, size.height *0.25);
    path.lineTo(size.width, 0);
   
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return true;
  }

}

class HeaderWave extends StatelessWidget {
  final Color color;

  const HeaderWave({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(this.color),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter{
  final Color color;

  const _HeaderWavePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  new Paint();

    lapiz.color=color;//Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    final path = Path();
    path.lineTo(0, size.height *0.25);
    path.quadraticBezierTo(size.width*0.25, size.height *0.30, size.width*0.50,size.height*0.25);
    path.quadraticBezierTo(size.width*0.75, size.height *0.20, size.width,size.height*0.25);
   path.lineTo(size.width, 0);
   
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return true;
  }

}

class HeaderWaveBottom extends StatelessWidget {
  const HeaderWaveBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveBottomPainter(),
      ),
    );
  }
}

class _HeaderWaveBottomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  new Paint();

    lapiz.color=Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height*0.90);
    path.quadraticBezierTo(size.width*0.25, size.height *0.95, size.width*0.50,size.height*0.90);
    path.quadraticBezierTo(size.width*0.75, size.height *0.85, size.width,size.height*0.90);
   
   path.lineTo(size.width, size.height);
   
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return true;
  }

}

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff6d05e8),
        Color(0xffc012ff),
        Color(0xff6d05fa)
      ],
      stops: [
        0.2,
        0.3,
        1.0
      ]
    );

    final Rect rect = Rect.fromCircle(
      center: Offset(0.0,55.0),
      radius: 180.0
    );



    final lapiz =  new Paint()..shader = gradient.createShader(rect);


    //lapiz.color=Color(0xff615AAB)
    //lapiz.color=Colors.red;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    final path = Path();
    path.lineTo(0, size.height *0.25);
    path.quadraticBezierTo(size.width*0.25, size.height *0.30, size.width*0.50,size.height*0.25);
    path.quadraticBezierTo(size.width*0.75, size.height *0.20, size.width,size.height*0.25);
   path.lineTo(size.width, 0);
   
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return true;
  }

}

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subTitle;
  final Color colorPrimary;
  final Color colorScondary;

  const IconHeader({
    @required this.icon, 
    @required this.title, 
    @required this.subTitle, 
    this.colorPrimary = Colors.grey, 
    this.colorScondary = Colors.blueGrey
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(
          colorPrimary: this.colorPrimary,
          colorScondary: this.colorScondary,
        ),
        Positioned(
          top: -40,
          left: -50,
          child: FaIcon(this.icon, 
          size:200,
          color:Colors.white.withOpacity(0.2))
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 50, width: double.infinity,),
            Text(this.title,style:TextStyle(fontSize: 20.0,color:Colors.white.withOpacity(0.7))),
            SizedBox(height: 20,),
            Text(this.subTitle,style:TextStyle(fontSize: 25.0,color:Colors.white.withOpacity(0.7))),
            SizedBox(height: 10,),
            FaIcon(this.icon, 
              size:80,
              color:Colors.white
            )
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color colorPrimary;
  final Color colorScondary;

  _IconHeaderBackground({
    @required this.colorPrimary, 
    @required this.colorScondary
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:220.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            this.colorPrimary,
            this.colorScondary
          ]
        )
      ),
    );
  }
}